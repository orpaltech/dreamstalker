#include "remddatafilesource.h"

#include "QFile"
#include <QThread>
#include <QTextStream>


/****************************************************/

QRemDDataFileSourceThread::QRemDDataFileSourceThread(const QString& dataFileName, QObject *parent)
    : QThread(parent)
    , m_dataFile(new QFile(dataFileName, this))
{
    m_dataFile->open(QIODevice::ReadOnly | QIODeviceBase::ExistingOnly | QIODevice::Text);
}

QRemDDataFileSourceThread::~QRemDDataFileSourceThread()
{
    m_dataFile->close();
}

void QRemDDataFileSourceThread::run()
{
    QByteArray result;
    quint16 sample;

    if (!m_dataFile->isOpen())
        return;

    /* ... here is the expensive or blocking operation ... */

    while (!m_dataFile->atEnd() && !QThread::isInterruptionRequested()) {
        QByteArray temp = m_dataFile->read(4);
        sample = temp.toUShort(nullptr, 16);

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

bool QRemDDataFileSource::start(QIODevice *destDevice)
{
    m_destDevice = destDevice;
    connect(m_workerThread, &QRemDDataFileSourceThread::dataSamplesReady, this, &QRemDDataFileSource::handleDataSamples);
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
    m_destDevice->write(samples);
}
