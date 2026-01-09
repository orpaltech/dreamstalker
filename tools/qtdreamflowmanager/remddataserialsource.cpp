#include "remddataserialsource.h"

#include <QMessageBox>

/****************************************************/

QRemDDataSerialSource::QRemDDataSerialSource(QSerialPort *serialPort, QObject *parent)
    : QRemDDataSource(parent)
    , m_serialPort(serialPort)
{
}

QRemDDataSerialSource::~QRemDDataSerialSource()
{
    stop();
}

bool QRemDDataSerialSource::start(QIODevice *destDevice)
{
    m_destDevice = destDevice;
    connect(m_serialPort, &QSerialPort::errorOccurred, this, &QRemDDataSerialSource::onSerialError);
    connect(m_serialPort, &QSerialPort::readyRead, this, &QRemDDataSerialSource::onSerialData);

    return true;
}

void QRemDDataSerialSource::stop()
{
    if (!m_destDevice)
        return; // already stopped

    m_destDevice = nullptr;

    disconnect(m_serialPort, &QSerialPort::errorOccurred, this, &QRemDDataSerialSource::onSerialError);
    disconnect(m_serialPort, &QSerialPort::readyRead, this, &QRemDDataSerialSource::onSerialData);

    emit dataSourceStopped(0, QString());
}

void QRemDDataSerialSource::onSerialData()
{
    quint16 sample;
    quint64 maxSize = (m_serialPort->bytesAvailable() / sizeof(quint16)) * sizeof(quint16);
    const QByteArray bytes = m_serialPort->read(maxSize);
    QDataStream dataStream(bytes);
    dataStream.setByteOrder(QDataStream::LittleEndian);
    while(!dataStream.atEnd()) {
        dataStream >> sample;
        m_buffer.append((char*)&sample, sizeof(quint16));

        if (m_buffer.length() == DATA_PKT_SIZE * sizeof(quint16)) {
            m_destDevice->write(m_buffer);
            m_buffer.clear();
        }
    }
}

void QRemDDataSerialSource::onSerialError(QSerialPort::SerialPortError error)
{
    if (error == QSerialPort::ResourceError) {

        disconnect(m_serialPort, &QSerialPort::errorOccurred, this, &QRemDDataSerialSource::onSerialError);
        disconnect(m_serialPort, &QSerialPort::readyRead, this, &QRemDDataSerialSource::onSerialData);

        emit dataSourceStopped(error, m_serialPort->errorString());
    }
}
