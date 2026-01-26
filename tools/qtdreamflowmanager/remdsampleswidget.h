#ifndef REMDSAMPLESWIDGET_H
#define REMDSAMPLESWIDGET_H

#include <QWidget>

/****************************************************/

QT_FORWARD_DECLARE_CLASS(QChartView)
QT_FORWARD_DECLARE_CLASS(QLineSeries)
QT_FORWARD_DECLARE_CLASS(QRemDSampleSeriesDevice)
QT_FORWARD_DECLARE_CLASS(QRemDDataSource)

/****************************************************/

class QRemDSamplesWidget : public QWidget
{
    Q_OBJECT
public:
    explicit QRemDSamplesWidget(QRemDDataSource *sourceSamples, QWidget *parent = nullptr);
    ~QRemDSamplesWidget();

private:
    void setupLayout();

private:
    QChartView  *m_viewSamples;
    QLineSeries *m_seriesSamples;

    QRemDDataSource         *m_sourceSamples;
    QRemDSampleSeriesDevice *m_seriesDeviceSamples;

};

#endif // REMDSAMPLESWIDGET_H
