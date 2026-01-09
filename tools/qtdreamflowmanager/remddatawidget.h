#ifndef REMDDATAWIDGET_H
#define REMDDATAWIDGET_H

#include <QWidget>

/****************************************************/

QT_FORWARD_DECLARE_CLASS(QChart)
QT_FORWARD_DECLARE_CLASS(QLineSeries)
QT_FORWARD_DECLARE_CLASS(QRemDDataSeriesDevice)
QT_FORWARD_DECLARE_CLASS(QRemDDataSource)

/****************************************************/

class QRemDDataWidget : public QWidget
{
    Q_OBJECT
public:
    explicit QRemDDataWidget(QRemDDataSource *dataSource, QWidget *parent = nullptr);
    ~QRemDDataWidget();

private:
    QChart *m_dataChart;
    QLineSeries *m_dataSeries;
    QRemDDataSource *m_dataSource;
    QRemDDataSeriesDevice *m_dataSeriesDevice;

};

#endif // REMDDATAWIDGET_H
