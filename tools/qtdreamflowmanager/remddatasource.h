#ifndef REMDDATASOURCE_H
#define REMDDATASOURCE_H

#include <QObject>
#include <QByteArray>

/****************************************************/
#define DATA_PKT_SIZE       1000
//#define DATA_SAMPLE_RATE    1000    // ADC sample rate in dreamstalker
#define DATA_SAMPLE_RATE    10000

/****************************************************/

typedef struct __attribute__((packed)) s_remd_epoch_stats {
    uint16_t magic;           // 0xAA55
    uint16_t epoch_index;     // Time/Index
    uint16_t move_count;      // Saccades counted
    uint16_t gate_ceiling;    // The Blink Filter height (from sensitivity)
    uint16_t restlessness;    // The variability (shakiness)
    uint16_t epoch_peak_delta;// The strongest single move seen
    uint8_t  bucket_state;    // Current level of the Leaky Bucket (Integrator)
    uint8_t  trigger_status;  // LED intensity (0, 15, 20, 30)
} remd_epoch_stats_t;

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
