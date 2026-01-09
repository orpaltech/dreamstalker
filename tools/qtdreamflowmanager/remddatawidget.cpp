#include "remddatawidget.h"
#include "remddataseriesdevice.h"
#include "remddatasource.h"

#include <QChart>
#include <QChartView>
#include <QFile>
#include <QLineSeries>
#include <QMessageBox>
#include <QValueAxis>
#include <QVBoxLayout>

/****************************************************/

QRemDDataWidget::QRemDDataWidget(QRemDDataSource *dataSource, QWidget *parent)
    : QWidget{parent}
    , m_dataChart(new QChart)
    , m_dataSeries(new QLineSeries)
    , m_dataSource(dataSource)
{
    auto chartView = new QChartView(m_dataChart);
    m_dataChart->addSeries(m_dataSeries);
    auto axisX = new QValueAxis;
    axisX->setRange(0, QRemDDataSeriesDevice::sampleCount);
    axisX->setLabelFormat("%g");
    axisX->setTitleText("Samples");
    auto axisY = new QValueAxis;
    axisY->setRange(0, std::pow(2, 10));
    axisY->setTitleText("Level");
    m_dataChart->addAxis(axisX, Qt::AlignBottom);
    m_dataSeries->attachAxis(axisX);
    m_dataChart->addAxis(axisY, Qt::AlignLeft);
    m_dataSeries->attachAxis(axisY);
    m_dataChart->legend()->hide();
    m_dataChart->setTitle("Data from the REM detector");

    auto mainLayout = new QVBoxLayout(this);
    mainLayout->addWidget(chartView);

    m_dataSource->setParent(this);

    m_dataSeriesDevice = new QRemDDataSeriesDevice(m_dataSeries, this);
    m_dataSeriesDevice->open(QIODevice::WriteOnly);
    m_dataSource->start(m_dataSeriesDevice);
}

QRemDDataWidget::~QRemDDataWidget()
{
    m_dataSource->stop();
    m_dataSeriesDevice->close();
}
