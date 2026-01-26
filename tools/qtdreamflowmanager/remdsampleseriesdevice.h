#ifndef REMDSAMPLESERIESDEVICE_H
#define REMDSAMPLESERIESDEVICE_H

#include <QIODevice>
#include <QList>
#include <QPointF>
#include "remddatasource.h"

/****************************************************/

QT_FORWARD_DECLARE_CLASS(QXYSeries)

/****************************************************/

class QRemDSampleSeriesDevice : public QIODevice
{
    Q_OBJECT
public:
    explicit QRemDSampleSeriesDevice(QXYSeries *series, QObject *parent = nullptr);
    ~QRemDSampleSeriesDevice();

    static constexpr int sampleCount = DATA_PKT_SIZE;

protected:
    qint64 readData(char *data, qint64 maxlen) override;
    qint64 writeData(const char *data, qint64 len) override;

private:
    QXYSeries *m_series;
    QList<QPointF> m_buffer;
};

#endif // REMDSAMPLESERIESDEVICE_H
