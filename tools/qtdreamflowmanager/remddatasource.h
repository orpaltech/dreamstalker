#ifndef REMDDATASOURCE_H
#define REMDDATASOURCE_H

#include <QObject>

/****************************************************/
#define DATA_PKT_SIZE       1000
#define DATA_SAMPLE_RATE    1000    // ADC sample rate in dreamstalker
//#define DATA_SAMPLE_RATE    10000

/****************************************************/

class QRemDDataSource : public QObject
{
    Q_OBJECT
public:
    explicit QRemDDataSource(QObject *parent = nullptr);

public:
    virtual bool start(QIODevice *destDevice) = 0;
    virtual void stop() = 0;

signals:
    void dataSourceStopped(int error, const QString& message);
};

#endif // REMDDATASOURCE_H
