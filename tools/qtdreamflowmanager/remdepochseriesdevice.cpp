#include <QChart>
#include <QTimeZone>
#include <QXYSeries>
#include "remdepochseriesdevice.h"
#include "remddatasource.h"


/****************************************************/

QRemDEpochSeriesDevice::QRemDEpochSeriesDevice(QXYSeries *rest, QXYSeries *vel,
                                               QXYSeries *moves, QXYSeries *trig,
                                               QXYSeries *bucket, QXYSeries *ceiling,
                                               QObject *parent)
    : QIODevice{ parent }
    , m_restlessness(rest), m_velocity(vel), m_moves(moves), m_triggers(trig)
    , m_bucket(bucket), m_ceiling(ceiling)
    , m_minX(-1.), m_maxX(0)
    , m_maxYTop(0.), m_maxYBottom(0.)
{
}

qint64 QRemDEpochSeriesDevice::readData(char *data, qint64 maxlen)
{
    Q_UNUSED(data);
    Q_UNUSED(maxlen);
    return 0;
}

qint64 QRemDEpochSeriesDevice::writeData(const char *data, qint64 len)
{
    constexpr int headerSize = sizeof(remd_epoch_config_t);
    if (len == headerSize) {
        const auto *header = reinterpret_cast<const remd_epoch_config_t*>(data);
        emit profileResolved(header->profile);

        qint64 unixSeconds = static_cast<qint64>(header->start_time);
        m_startTime = QDateTime::fromSecsSinceEpoch(unixSeconds, QTimeZone::UTC);
        // Strip the "UTC" label and force it to be "Local" without changing the numbers
        m_startTime = QDateTime(m_startTime.date(), m_startTime.time(), QTimeZone::LocalTime);
        emit startTimeResolved(m_startTime);

    } else {
        constexpr int structSize = sizeof(remd_epoch_stats_t);
        int numStructs = static_cast<int>(len / structSize);

        double batchMaxTop = 0;
        double batchMaxBottom = 0;

        for (int i = 0; i < numStructs; ++i) {
            const auto *s = reinterpret_cast<const remd_epoch_stats_t*>(data + (i * structSize));

            if (s->magic != 0xAA55)
                continue;

            // Tracking indices for scrollbar/window logic
            double index = static_cast<double>(s->epoch_index);
            if (m_minX < 0) m_minX = index;
            if (index > m_maxX) m_maxX = index;

            // Mapping: Index 1 = StartTime, Index 2 = StartTime + 30s, etc.
            qint64 offsetSeconds = static_cast<qint64>((index - 1) * 30);

            // QDateTimeAxis requires milliseconds (plotX)
            qint64 plotX = m_startTime.addSecs(offsetSeconds).toMSecsSinceEpoch();

            // Append to Top Chart Series
            m_restlessness->append(plotX, s->restlessness);
            m_velocity->append(plotX, s->epoch_peak_delta);
            if (m_ceiling) m_ceiling->append(plotX, s->gate_ceiling);

            // Append to Bottom Chart Series
            m_moves->append(plotX, s->move_count);
            if (m_bucket) m_bucket->append(plotX, s->bucket_state);

            // Only plot triggers if they occurred
            if (s->trigger_status > 0) {
                m_triggers->append(plotX, static_cast<double>(s->trigger_status));
            }

            // --- Real-time Peak Tracking for Vertical Scaling ---
            double currentTop = qMax((double)s->epoch_peak_delta, qMax((double)s->gate_ceiling, (double)s->restlessness));
            batchMaxTop = qMax(batchMaxTop, currentTop);

            double currentBottom = qMax((double)s->move_count, qMax((double)s->bucket_state, (double)s->trigger_status));
            batchMaxBottom = qMax(batchMaxBottom, currentBottom);
        }

        m_maxYTop = qMax(m_maxYTop, batchMaxTop);
        m_maxYBottom = qMax(m_maxYBottom, batchMaxBottom);

        // Notify Widget to update axis ranges and scrollbar
        emit dataUpdated(m_minX, m_maxX, m_maxYTop, m_maxYBottom);
    }
    return len;
}

