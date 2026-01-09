#ifndef REMDDATASERIESDEVICE_H
#define REMDDATASERIESDEVICE_H

#include <QIODevice>
#include <QList>
#include <QPointF>
#include "remddatasource.h"

/****************************************************/

QT_FORWARD_DECLARE_CLASS(QXYSeries)

/****************************************************/

class QRemDDataSeriesDevice : public QIODevice
{
    Q_OBJECT
public:
    explicit QRemDDataSeriesDevice(QXYSeries *series, QObject *parent = nullptr);
    ~QRemDDataSeriesDevice();

    static constexpr int sampleCount = DATA_PKT_SIZE;

protected:
    virtual qint64 readData(char *data, qint64 maxlen);
    virtual qint64 writeData(const char *data, qint64 len);

private:
    QXYSeries *m_series;
    QList<QPointF> m_buffer;
};

#endif // REMDDATASERIESDEVICE_H
