#include "remddataseriesdevice.h"
#include <QXYSeries>

/****************************************************/

QRemDDataSeriesDevice::QRemDDataSeriesDevice(QXYSeries *series, QObject *parent)
    : QIODevice(parent)
    , m_series(series)
{
}

QRemDDataSeriesDevice::~QRemDDataSeriesDevice()
{
}

qint64 QRemDDataSeriesDevice::readData(char *data, qint64 maxlen)
{
    Q_UNUSED(data);
    Q_UNUSED(maxlen);
    return -1;
}

qint64 QRemDDataSeriesDevice::writeData(const char *data, qint64 maxSize)
{
    quint16 *samples = (quint16*)data;

    if (m_buffer.isEmpty()) {
        m_buffer.reserve(sampleCount);
        for (int i = 0; i < sampleCount; ++i)
            m_buffer.append(QPointF(i, 0));
    }

    int start = 0;
    const int availableSamples = maxSize/sizeof(quint16);
    if (availableSamples < sampleCount) {
        start = sampleCount - availableSamples;
        for (int s = 0; s < start; ++s)
            m_buffer[s].setY(m_buffer.at(s + availableSamples).y());
    }

    for (int s = start; s < sampleCount; ++s, samples++) {
        quint16 sample = *samples;
        m_buffer[s].setY(qreal(sample));
    }

    m_series->replace(m_buffer);
    return maxSize;
}
