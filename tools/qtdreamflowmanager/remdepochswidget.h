#ifndef REMDEPOCHSWIDGET_H
#define REMDEPOCHSWIDGET_H

#include <QWidget>

/****************************************************/

QT_FORWARD_DECLARE_CLASS(QChart)
QT_FORWARD_DECLARE_CLASS(QChartView)
QT_FORWARD_DECLARE_CLASS(QLineSeries)
QT_FORWARD_DECLARE_CLASS(QScatterSeries)
QT_FORWARD_DECLARE_CLASS(QScrollBar)
QT_FORWARD_DECLARE_CLASS(QValueAxis)
QT_FORWARD_DECLARE_CLASS(QRemDEpochSeriesDevice)
QT_FORWARD_DECLARE_CLASS(QRemDDataSource)

/****************************************************/

class QRemDEpochsWidget : public QWidget
{
    Q_OBJECT
public:
    explicit QRemDEpochsWidget(QRemDDataSource *sourceEpochs, QWidget *parent = nullptr);
    ~QRemDEpochsWidget();

    void clearCharts();

private:
    void setupLayout();
    void updateAxisGrid(QValueAxis* axis, double minVal, double maxVal, bool isHorizontal);
    QString getProfileNameFromId(int id);

private slots:
    void handleScroll(int value);
    void hanldeDataUpdated(double minX, double maxX, double peakTop, double peakBottom);
    void handleProfileIdentified(int profileId);

private:
    QChartView      *m_viewTop;
    QChartView      *m_viewBottom;
    QScrollBar      *m_scrollbar;

    // Top Chart Series
    QLineSeries     *m_seriesRestless;
    QLineSeries     *m_seriesVelocity;

    // Bottom Chart Series
    QLineSeries     *m_seriesMoves;
    QScatterSeries  *m_seriesTrigger;

    QRemDDataSource         *m_sourceEpochs;
    QRemDEpochSeriesDevice  *m_epochsSeriesDevice;

    double m_minX;
    double m_maxYTop, m_maxYBottom;
    bool m_autoScroll;      // Toggle this to turn scrolling on/off
    int m_windowSize;       // Show the last 1000 epochs
    bool m_isFollowingLive;
};

#endif // REMDEPOCHSWIDGET_H
