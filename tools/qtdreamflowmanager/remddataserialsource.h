#ifndef REMDDATASERIALSOURCE_H
#define REMDDATASERIALSOURCE_H

#include "remddatasource.h"
#include <QSerialPort>

/****************************************************/

class QRemDDataSerialSource : public QRemDDataSource
{
    Q_OBJECT
public:
    explicit QRemDDataSerialSource(QSerialPort *serialPort, QObject *parent = nullptr);
    ~QRemDDataSerialSource();

// QRemDDataSource
    virtual bool start(QIODevice *destDevice);
    virtual void stop();

private slots:
    void onSerialData();
    void onSerialError(QSerialPort::SerialPortError error);

private:
    QSerialPort *m_serialPort;
    QIODevice *m_destDevice;
    QByteArray m_buffer;
};

#endif // REMDDATASERIALSOURCE_H
