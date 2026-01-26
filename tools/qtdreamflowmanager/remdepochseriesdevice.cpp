#include <QChart>
#include <QXYSeries>
#include "remdepochseriesdevice.h"
#include "remddatasource.h"


/****************************************************/

QRemDEpochSeriesDevice::QRemDEpochSeriesDevice(QXYSeries *rest, QXYSeries *vel,
                                               QXYSeries *moves, QXYSeries *trig,
                                               QObject *parent)
    : QIODevice(parent)
    , m_restlessness(rest), m_velocity(vel), m_moves(moves), m_triggers(trig)
    , m_minX(-1.)
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
    if (len == 1) {
        // header parsed, get the profile id
        emit profileIdentified(*data);

    } else {
        constexpr int structSize = sizeof(remd_epoch_stats_t);
        int numStructs = len / structSize;

        double lastX = 0;

        for (int i = 0; i < numStructs; ++i) {
            const auto *s = reinterpret_cast<const remd_epoch_stats_t*>(data + (i * structSize));
            if (s->magic != 0xAA55)
                continue;

            lastX = s->epoch_index;
            if (m_minX < 0) m_minX = lastX;

            // Append Data (Background work)
            m_restlessness->append(lastX, s->restlessness);
            m_velocity->append(lastX, s->peak_velocity);
            m_moves->append(lastX, s->move_count);

            // Update the absolute peaks seen so far
            m_maxYTop = qMax(m_maxYTop, qMax((double)s->restlessness, (double)s->peak_velocity));
            m_maxYBottom = qMax(m_maxYBottom, (double)s->move_count);

            // 3. Add Trigger Triangle (Relative to current known bottom max)
            if (s->trigger_status > 0) {
                m_triggers->append(lastX, m_maxYBottom - 1);
            }
        }

        // Send everything to the Widget in one signal
        emit dataUpdated(m_minX, lastX, m_maxYTop, m_maxYBottom);
    }
    return len;
}
