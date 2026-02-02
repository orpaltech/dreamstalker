#include <QChart>
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

/*qint64 QRemDEpochSeriesDevice::writeData(const char *data, qint64 len)
{
    if (len == 1) {
        // header parsed, get the profile id
        emit profileIdentified(*data);

    } else {
        constexpr int structSize = sizeof(remd_epoch_stats_t);
        int numStructs = len / structSize;
        double lastX = 0;

        // 1. Start with fresh peaks for THIS chunk of data
        double batchMaxTop = 0;
        double batchMaxBottom = 0;

        for (int i = 0; i < numStructs; ++i) {
            const auto *s = reinterpret_cast<const remd_epoch_stats_t*>(data + (i * structSize));
            if (s->magic != 0xAA55) continue;

            lastX = s->epoch_index;
            if (m_minX < 0) m_minX = lastX;

            // Append your data as usual...
            m_restlessness->append(lastX, s->restlessness);
            m_velocity->append(lastX, s->peak_velocity);
            if (m_ceiling) m_ceiling->append(lastX, s->gate_ceiling);
            m_moves->append(lastX, s->move_count);
            if (m_bucket) m_bucket->append(lastX, s->bucket_state);

            if (s->trigger_status > 0) {
                m_triggers->append(lastX, s->trigger_status);
            }

            // 2. Track the peaks of ONLY this incoming batch
            double currentTop = qMax((double)s->peak_velocity, (double)s->gate_ceiling);
            currentTop = qMax(currentTop, (double)s->restlessness);
            batchMaxTop = qMax(batchMaxTop, currentTop);

            double currentBottom = qMax((double)s->move_count, (double)s->bucket_state);
            currentBottom = qMax(currentBottom, (double)s->trigger_status);
            batchMaxBottom = qMax(batchMaxBottom, currentBottom);
        }

        // 3. Compare batch peaks with global peaks
        m_maxYTop = qMax(m_maxYTop, batchMaxTop);
        m_maxYBottom = qMax(m_maxYBottom, batchMaxBottom);

        emit dataUpdated(m_minX, lastX, m_maxYTop, m_maxYBottom);
    }
    return len;
}*/

/*qint64 QRemDEpochSeriesDevice::writeData(const char *data, qint64 len)
{
    if (len == 1) {
        // Header parsed (Profile ID), notify the widget
        emit profileIdentified(static_cast<quint8>(*data));
    } else {
        constexpr int structSize = sizeof(remd_epoch_stats_t);
        int numStructs = static_cast<int>(len / structSize);
        double lastX = 0;

        // Reset batch peaks to 0 so we only track what's in this specific write call
        double batchMaxTop = 0;
        double batchMaxBottom = 0;

        for (int i = 0; i < numStructs; ++i) {
            const auto *s = reinterpret_cast<const remd_epoch_stats_t*>(data + (i * structSize));

            // Safety check: skip corrupted data or misaligned offsets
            if (s->magic != 0xAA55)
                continue;

            lastX = static_cast<double>(s->epoch_index);

            // Establish the very first X coordinate for the chart scrolling logic
            if (m_minX < 0) {
                m_minX = lastX;
            }

            // --- 1. Append Data to Top Chart Series ---
            m_restlessness->append(lastX, s->restlessness);
            // UPDATE: Using epoch_peak_delta from your packed struct
            m_velocity->append(lastX, s->epoch_peak_delta);
            if (m_ceiling) {
                m_ceiling->append(lastX, s->gate_ceiling);
            }

            // --- 2. Append Data to Bottom Chart Series ---
            m_moves->append(lastX, s->move_count);
            if (m_bucket) {
                m_bucket->append(lastX, s->bucket_state);
            }

            // --- 3. Append Trigger Events (Scatter Points) ---
            if (s->trigger_status > 0) {
                // Now points to the correct 14th byte; should no longer be 80+
                m_triggers->append(lastX, static_cast<double>(s->trigger_status));
            }

            // --- 4. Calculate Batch Peaks ---

            // Top Chart Peak: Using epoch_peak_delta
            double currentTop = qMax((double)s->epoch_peak_delta, (double)s->gate_ceiling);
            currentTop = qMax(currentTop, (double)s->restlessness);
            batchMaxTop = qMax(batchMaxTop, currentTop);

            // Bottom Chart Peak
            double currentBottom = qMax((double)s->move_count, (double)s->bucket_state);
            currentBottom = qMax(currentBottom, (double)s->trigger_status);
            batchMaxBottom = qMax(batchMaxBottom, currentBottom);
        }

        // --- 5. Update Global Peaks ---
        m_maxYTop = qMax(m_maxYTop, batchMaxTop);
        m_maxYBottom = qMax(m_maxYBottom, batchMaxBottom);

        // Signal the widget to refresh the axes and scroll position
        emit dataUpdated(m_minX, lastX, m_maxYTop, m_maxYBottom);
    }

    return len;
}*/

qint64 QRemDEpochSeriesDevice::writeData(const char *data, qint64 len)
{
    if (len == 1) {
        emit profileIdentified(static_cast<quint8>(*data));
    } else {
        constexpr int structSize = sizeof(remd_epoch_stats_t);
        int numStructs = static_cast<int>(len / structSize);

        double batchMaxTop = 0;
        double batchMaxBottom = 0;

        for (int i = 0; i < numStructs; ++i) {
            const auto *s = reinterpret_cast<const remd_epoch_stats_t*>(data + (i * structSize));

            if (s->magic != 0xAA55)
                continue;

            double lastX = static_cast<double>(s->epoch_index);
            if (m_minX < 0) m_minX = lastX;

            // Update the global maximum
            if (lastX > m_maxX) m_maxX = lastX;

            // --- Top Chart ---
            m_restlessness->append(lastX, s->restlessness);
            m_velocity->append(lastX, s->epoch_peak_delta);
            if (m_ceiling) m_ceiling->append(lastX, s->gate_ceiling);

            // --- Bottom Chart ---
            m_moves->append(lastX, s->move_count);
            if (m_bucket) m_bucket->append(lastX, s->bucket_state);

            if (s->trigger_status > 0) {
                m_triggers->append(lastX, static_cast<double>(s->trigger_status));
            }

            // --- Calculate Peaks (Nested qMax to avoid syntax errors) ---
            double currentTop = qMax((double)s->epoch_peak_delta, qMax((double)s->gate_ceiling, (double)s->restlessness));
            batchMaxTop = qMax(batchMaxTop, currentTop);

            double currentBottom = qMax((double)s->move_count, qMax((double)s->bucket_state, (double)s->trigger_status));
            batchMaxBottom = qMax(batchMaxBottom, currentBottom);
        }

        m_maxYTop = qMax(m_maxYTop, batchMaxTop);
        m_maxYBottom = qMax(m_maxYBottom, batchMaxBottom);

        emit dataUpdated(m_minX, m_maxX, m_maxYTop, m_maxYBottom);
    }
    return len;
}
