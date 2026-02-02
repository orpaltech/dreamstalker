#ifndef REMDEPOCHSERIESDEVICE_H
#define REMDEPOCHSERIESDEVICE_H

#include <QIODevice>

/****************************************************/

QT_FORWARD_DECLARE_CLASS(QXYSeries)

/****************************************************/

class QRemDEpochSeriesDevice : public QIODevice
{
    Q_OBJECT
public:
    explicit QRemDEpochSeriesDevice(QXYSeries *rest, QXYSeries *vel,
                                    QXYSeries *moves, QXYSeries *trig,
                                    QXYSeries *bucket, QXYSeries *ceiling,
                                    QObject *parent = nullptr);
    ~QRemDEpochSeriesDevice() = default;

signals:
    void dataUpdated(double minX, double maxX, double peakTop, double peakBottom);
    void profileIdentified(int profileId);

protected:
    qint64 readData(char *data, qint64 maxlen) override;
    qint64 writeData(const char *data, qint64 len) override;

private:
    QXYSeries *m_restlessness, *m_velocity, *m_moves, *m_triggers;
    QXYSeries *m_bucket, *m_ceiling;
    double m_minX, m_maxX;
    double m_maxYTop, m_maxYBottom;
};

#endif // REMDEPOCHSERIESDEVICE_H
