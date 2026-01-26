#include <QChartView>
#include <QLineSeries>
#include <QValueAxis>
#include <QVBoxLayout>
#include "remdsampleswidget.h"
#include "remdsampleseriesdevice.h"
#include "remddatasource.h"

/****************************************************/

QRemDSamplesWidget::QRemDSamplesWidget(QRemDDataSource *sourceSamples, QWidget *parent)
    : QWidget{parent}
    , m_sourceSamples(sourceSamples)
{
    m_seriesSamples = new QLineSeries(this);
    // Set names for the legend
    m_seriesSamples->setName("Samples");

    setupLayout();

    m_sourceSamples->setParent(this);

    m_seriesDeviceSamples = new QRemDSampleSeriesDevice(m_seriesSamples, this);
    m_seriesDeviceSamples->open(QIODevice::WriteOnly);
    m_sourceSamples->start(m_seriesDeviceSamples);
}

QRemDSamplesWidget::~QRemDSamplesWidget()
{
    m_sourceSamples->stop();
    m_seriesDeviceSamples->close();
}

void QRemDSamplesWidget::setupLayout()
{
    QVBoxLayout *layout = new QVBoxLayout(this);

    QChart *chart = new QChart();
    chart->addSeries(m_seriesSamples);
    auto axisX = new QValueAxis;
    axisX->setRange(0, QRemDSampleSeriesDevice::sampleCount);
    axisX->setLabelFormat("%g");
    axisX->setTitleText("Samples");
    auto axisY = new QValueAxis;
    axisY->setRange(0, std::pow(2, 10));
    axisY->setTitleText("Level");
    chart->addAxis(axisX, Qt::AlignBottom);
    m_seriesSamples->attachAxis(axisX);
    chart->addAxis(axisY, Qt::AlignLeft);
    m_seriesSamples->attachAxis(axisY);
    chart->legend()->hide();
    chart->setTitle("Data from the REM detector");

    m_viewSamples = new QChartView(chart);
    m_viewSamples->setRenderHint(QPainter::Antialiasing);
    layout->addWidget(m_viewSamples);
}
