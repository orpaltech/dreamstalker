#include "remddatafilesource.h"
#include "QFile"
#include <QFileInfo>
#include <QRegularExpression>
#include <QThread>
#include <QTextStream>


/****************************************************/

QRemDDataFileSourceThread::QRemDDataFileSourceThread(const QString& dataFileName, QObject *parent)
    : QThread{parent}
    , m_fileType{DataFileType::None}
    , m_dataFile{new QFile(dataFileName, this)}
{
    QFileInfo dataFile(dataFileName);
    QString fileExt = dataFile.completeSuffix().toLower();
    QFileDevice::OpenMode fileOpenFlags = QIODevice::ReadOnly | QIODeviceBase::ExistingOnly;

    if (fileExt == "bin")
        m_fileType = DataFileType::SampleBin;
    else if (fileExt == "hex") {
        m_fileType = DataFileType::SampleHex;
        fileOpenFlags |= QIODevice::Text;
    }
    else if (fileExt == "dat")
        m_fileType = DataFileType::Epochs;

    if (m_fileType != DataFileType::None) {
        bool result = m_dataFile->open(fileOpenFlags);

        if (result && m_fileType == DataFileType::Epochs) {
            constexpr int headerSize = sizeof(remd_epoch_config_t);
            QByteArray headerBytes = m_dataFile->read(headerSize);
            if (headerBytes.size() == headerSize) {
                const auto *header = reinterpret_cast<const remd_epoch_config_t*>(headerBytes.constData());
                if (header->magic == REMD_EPOCH_MAGIC) {

                    QString headerStr = QString::fromUtf8(headerBytes).trimmed();
                    qDebug() << "File Header Metadata:" << headerStr;

                    m_header = headerBytes;
                }
            }
        }
    }
}

QRemDDataFileSourceThread::~QRemDDataFileSourceThread()
{
    if (m_dataFile->isOpen())
        m_dataFile->close();
}

void QRemDDataFileSourceThread::run()
{
    QByteArray result;
    quint16 sample = 0;

    if (!m_dataFile->isOpen())
        return;

    if (m_fileType == DataFileType::Epochs) {
        emit logHeaderParsed(m_header); // Tell the widget which profile this is
    }

    /* ... here is the expensive or blocking operation ... */

    while (!m_dataFile->atEnd() && !QThread::isInterruptionRequested()) {

        // --- LOGIC FOR EPOCH STRUCTURES (.DAT) ---
        if (m_fileType == DataFileType::Epochs) {
            QByteArray epoch = m_dataFile->read(sizeof(remd_epoch_stats_t));
            if (!epoch.isEmpty()) {
                emit dataSamplesReady(epoch);
            }
            // Epochs represent 30 seconds of real time.
            // 20ms delay allows for fast but visible playback.
            msleep(20);
            continue;
        }

        // --- LOGIC FOR RAW SAMPLES (.BIN / .HEX) ---

        if (m_fileType == DataFileType::SampleBin)
            sample = readSampleBin();
        else
        if (m_fileType == DataFileType::SampleHex)
            sample = readSampleHex();

        result.append((const char*)&sample, sizeof(quint16));

        if (result.length() == DATA_PKT_SIZE * sizeof(quint16)) {
            emit dataSamplesReady(result);
            result.clear();

            // Simulate a delay, as if the data were coming from a real device with a given sampling rate.
            unsigned long delay_us = 1000000UL * DATA_PKT_SIZE / DATA_SAMPLE_RATE;

            usleep(delay_us);
        }
    }

    if (!result.isEmpty()) {
        emit dataSamplesReady(result);
        result.clear();
    }
}

quint16 QRemDDataFileSourceThread::readSampleHex()
{
    QByteArray temp = m_dataFile->read(4);
    quint16 val = temp.toUShort(nullptr, 16);
    return val;
}

quint16 QRemDDataFileSourceThread::readSampleBin()
{
    QByteArray temp = m_dataFile->read(2);
    QDataStream stream(&temp, QIODevice::ReadOnly);
    stream.setByteOrder(QDataStream::LittleEndian);
    quint16 val;
    stream >> val;
    return val;
}

/****************************************************/

QRemDDataFileSource::QRemDDataFileSource(const QString& dataFileName, QObject *parent)
    : QRemDDataSource(parent)
    , m_workerThread(new QRemDDataFileSourceThread(dataFileName, this))
{
}

QRemDDataFileSource::~QRemDDataFileSource()
{
    stop();
}

bool QRemDDataFileSource::start(QIODevice *outputDevice)
{
    m_outputDevice = outputDevice;
    connect(m_workerThread, &QRemDDataFileSourceThread::dataSamplesReady, this, &QRemDDataFileSource::handleDataSamples);
    connect(m_workerThread, &QRemDDataFileSourceThread::logHeaderParsed, this, &QRemDDataFileSource::handleLogHeader);
    m_workerThread->start();

    return true;
}

void QRemDDataFileSource::stop()
{
    m_workerThread->requestInterruption();
    m_workerThread->wait();
    emit dataSourceStopped(0, QString());
}

void QRemDDataFileSource::handleDataSamples(const QByteArray& samples)
{
    m_outputDevice->write(samples);
}

void QRemDDataFileSource::handleLogHeader(const QByteArray& header)
{
    m_outputDevice->write(header);
}
