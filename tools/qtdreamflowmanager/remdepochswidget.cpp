#include <QChartView>
#include <QLineSeries>
#include <QScatterSeries>
#include <QScrollBar>
#include <QValueAxis>
#include <QVBoxLayout>
#include "remdepochseriesdevice.h"
#include "remddatasource.h"
#include "remdepochswidget.h"


QRemDEpochsWidget::QRemDEpochsWidget(QRemDDataSource *sourceEpochs, QWidget *parent)
    : QWidget{parent}
    , m_sourceEpochs(sourceEpochs)
    , m_minX(0.)
    , m_maxYTop(10.), m_maxYBottom(5.)
    , m_autoScroll(true), m_windowSize(2000), m_isFollowingLive(true)
{
    m_seriesRestless = new QLineSeries(this);
    m_seriesVelocity = new QLineSeries(this);
    m_seriesMoves    = new QLineSeries(this);
    m_seriesTrigger  = new QScatterSeries(this);

    // Set names for the legend
    m_seriesRestless->setName("Restlessness");
    m_seriesVelocity->setName("Peak Velocity");
    m_seriesMoves->setName("Saccade Count");

    m_seriesTrigger->setName("LED Trigger");
    m_seriesTrigger->setMarkerShape(QScatterSeries::MarkerShapeRectangle);
    m_seriesTrigger->setMarkerSize(10.0);
    m_seriesTrigger->setColor(Qt::red); // Red for the LED fire
    m_seriesTrigger->setBorderColor(Qt::transparent);

    setupLayout();

    m_epochsSeriesDevice = new QRemDEpochSeriesDevice(m_seriesRestless, m_seriesVelocity,
                                                      m_seriesMoves, m_seriesTrigger, this);

    connect(m_scrollbar, &QScrollBar::valueChanged, this, &QRemDEpochsWidget::handleScroll);
    connect(m_epochsSeriesDevice, &QRemDEpochSeriesDevice::dataUpdated, this, &QRemDEpochsWidget::hanldeDataUpdated);
    connect(m_epochsSeriesDevice, &QRemDEpochSeriesDevice::profileIdentified, this, &QRemDEpochsWidget::handleProfileIdentified);

    m_epochsSeriesDevice->open(QIODevice::WriteOnly);

    m_sourceEpochs->setParent(this);
    m_sourceEpochs->start(m_epochsSeriesDevice);
}

QRemDEpochsWidget::~QRemDEpochsWidget()
{
    m_sourceEpochs->stop();
    m_epochsSeriesDevice->close();
}

void QRemDEpochsWidget::clearCharts()
{
    m_seriesRestless->clear();
    m_seriesVelocity->clear();
    m_seriesMoves->clear();
    m_seriesTrigger->clear();
}

void QRemDEpochsWidget::setupLayout()
{
    QVBoxLayout *layout = new QVBoxLayout(this);

    // --- Top Chart: Intensity Metrics ---
    QChart *topChart = new QChart();
    topChart->addSeries(m_seriesRestless);
    topChart->addSeries(m_seriesVelocity);
    topChart->createDefaultAxes();
    topChart->setTitle("Sleep Intensity (Epochs)");
    topChart->axes(Qt::Horizontal).first()->setTitleText("Epoch (30s)");

    // --- Bottom Chart: REM Detection Metrics ---
    QChart *bottomChart = new QChart();
    bottomChart->addSeries(m_seriesMoves);
    bottomChart->addSeries(m_seriesTrigger);
    bottomChart->createDefaultAxes();
    bottomChart->setTitle("Saccades & System Response");

    m_viewTop = new QChartView(topChart);
    m_viewTop->setRenderHint(QPainter::Antialiasing);
    m_viewBottom = new QChartView(bottomChart);
    m_viewBottom->setRenderHint(QPainter::Antialiasing);

    m_scrollbar = new QScrollBar(Qt::Horizontal, this);

    layout->addWidget(m_viewTop);
    layout->addWidget(m_viewBottom);
    layout->addWidget(m_scrollbar);
}

void QRemDEpochsWidget::updateAxisGrid(QValueAxis *axis, double minVal, double maxVal, bool isHorizontal)
{
    if (!axis) return;

    double interval;
    double targetMax = maxVal;
    double targetMin = minVal;

    if (isHorizontal) {
        // For horizontal, use a fixed interval of 100 for consistent scrolling speed
        interval = 100.0;

        // Snap the moving window to the grid
        targetMin = std::floor(minVal / interval) * interval;
        targetMax = std::ceil(maxVal / interval) * interval;

        // Ensure we always show at least the minimum window size if requested
        if ((targetMax - targetMin) < 500) {
            targetMax = targetMin + 500;
        }
    } else {
        // ... (Vertical logic stays the same as before)
        double range = maxVal - minVal;
        if (range <= 25)       interval = 5.0;
        else if (range <= 60)  interval = 10.0;
        else if (range <= 120) interval = 20.0;
        else                   interval = 50.0;

        targetMin = 0; // Usually vertical starts at 0
        targetMax = std::ceil(maxVal / interval) * interval;
    }

    int tickCount = static_cast<int>((targetMax - targetMin) / interval) + 1;
    axis->setRange(targetMin, targetMax);
    axis->setTickCount(tickCount);
    axis->setLabelFormat("%d");
}

QString QRemDEpochsWidget::getProfileNameFromId(int id)
{
    switch (id) {
    case 1: return "Conservative";
    case 2: return "Morning Snooze";
    case 3: return "Balanced";
    case 4: return "Aggressive";
    case 5: return "Stress Shield";
    case 6: return "Stress Snooze";
    case 7: return "Stress Balance";
    default: return "Unknown Profile";
    }
}

void QRemDEpochsWidget::handleScroll(int value)
{
    m_isFollowingLive = (value >= m_scrollbar->maximum());

    double viewMax = static_cast<double>(value);
    double viewMin = viewMax - m_windowSize;

    // Prevent negative/pre-data indices
    if (viewMin < m_minX) {
        viewMin = m_minX;

        // If you want to keep the window exactly 1000 wide even at the start:
        // viewMax = viewMin + m_windowSize;
    }

    auto axisXTop = qobject_cast<QValueAxis*>(m_viewTop->chart()->axes(Qt::Horizontal).first());
    auto axisXBottom = qobject_cast<QValueAxis*>(m_viewBottom->chart()->axes(Qt::Horizontal).first());

    updateAxisGrid(axisXTop, viewMin, viewMax, true);
    updateAxisGrid(axisXBottom, viewMin, viewMax, true);
}

void QRemDEpochsWidget::hanldeDataUpdated(double minX, double maxX, double peakTop, double peakBottom)
{
    // Save the absolute start for handleScroll to use
    m_minX = minX;

    // --- Vertical Axis Logic ---

    // 1. Top Vertical Axis
    if (peakTop > m_maxYTop * 0.9 || m_maxYTop < 1.0) {
        auto axisYTop = qobject_cast<QValueAxis*>(m_viewTop->chart()->axes(Qt::Vertical).first());
        updateAxisGrid(axisYTop, 0, peakTop * 1.05, false);
        m_maxYTop = axisYTop->max();
    }

    // 2. Bottom Vertical Axis
    if (peakBottom > m_maxYBottom * 0.9 || m_maxYBottom < 1.0) {
        auto axisYBottom = qobject_cast<QValueAxis*>(m_viewBottom->chart()->axes(Qt::Vertical).first());
        updateAxisGrid(axisYBottom, 0, peakBottom + 2, false);
        m_maxYBottom = axisYBottom->max();
    }

    // --- Horizontal/Scrollbar Logic ---

    // Set the range. The minimum value the scrollbar can take should be
    // at least one window size away from the start to prevent jumping too far back.
    int scrollMin = static_cast<int>(minX);
    int scrollMax = static_cast<int>(maxX);

    m_scrollbar->setRange(scrollMin, scrollMax);


    if (m_isFollowingLive) {
        // This moves the scrollbar to the end,
        // which triggers handleScroll() automatically
        m_scrollbar->setValue(scrollMax);
    }
}


void QRemDEpochsWidget::handleProfileIdentified(int profileId)
{
    QString name = getProfileNameFromId(profileId);
    //m_profileLabel->setText(QString("Active Profile: <b>%1</b>").arg(name));

    // Optional: Log the specific restlessness factor for this profile
    // to help you debug the false trigger from this morning.
}

