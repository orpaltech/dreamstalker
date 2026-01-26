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
    uint16_t magic;           // Fixed value: 0xAA55
    uint16_t epoch_index;     // 0, 1, 2...
    uint16_t move_count;      // Total saccades in 30s
    uint16_t avg_noise;       // Noise floor (for quality check)
    uint16_t restlessness;    // The brute force average
    uint16_t peak_velocity;   // Highest velocity seen in epoch
    uint8_t  trigger_status;  // 1 if LEDs fired, 0 otherwise
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
