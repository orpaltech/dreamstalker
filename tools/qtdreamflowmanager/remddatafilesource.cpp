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
    , m_profileId(0)
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
            // Read the "S:xx|P:xx\n" line
            QByteArray header = m_dataFile->readLine();
            QString headerStr = QString::fromUtf8(header).trimmed();
            qDebug() << "File Header Metadata:" << headerStr;

            // Use a regular expression to find the number after "P:"
            // Example: "S:6|P:2" -> captures "2"
            QRegularExpression re("P:(\\d+)");
            QRegularExpressionMatch match = re.match(headerStr);
            if (match.hasMatch())
                m_profileId = match.captured(1).toInt();
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
        emit logHeaderParsed(m_profileId); // Tell the widget which profile this is
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
    connect(m_workerThread, &QRemDDataFileSourceThread::logHeaderParsed, this, &QRemDDataFileSource::handleLogHeaderParsed);
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

void QRemDDataFileSource::handleLogHeaderParsed(quint8 profileId)
{
    QByteArray data((const char *)&profileId, 1);
    m_outputDevice->write(data);
}
