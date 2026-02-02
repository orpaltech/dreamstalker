#include <QChartView>
#include <QCheckBox>
#include <QFrame>
#include <QGraphicsDropShadowEffect>
#include <QLineSeries>
#include <QPushButton>
#include <QScatterSeries>
#include <QScrollBar>
#include <QValueAxis>
#include <QVBoxLayout>
#include "remdepochseriesdevice.h"
#include "remddatasource.h"
#include "remdepochswidget.h"


/****************************************************/

class QRemDEpochsOverlayFrame : public QFrame {
public:
    QRemDEpochsOverlayFrame(QWidget *parent);

protected:
    void paintEvent(QPaintEvent *event) override;
    void mousePressEvent(QMouseEvent *event) override;
    void mouseMoveEvent(QMouseEvent *event) override;

private:
    QPoint m_dragOffset;
};


QRemDEpochsOverlayFrame::QRemDEpochsOverlayFrame(QWidget *parent)
    : QFrame{ parent }
{
    // Essential for semi-transparency in pure C++
    setAttribute(Qt::WA_TranslucentBackground);
}

void QRemDEpochsOverlayFrame::paintEvent(QPaintEvent *)
{
    QPainter painter(this);
    painter.setRenderHint(QPainter::Antialiasing);

    // Light "Frosted" Background - High Legibility
    QColor bgColor(240, 240, 240, 200);
    painter.setBrush(bgColor);
    painter.setPen(QPen(QColor(180, 180, 180), 1));
    painter.drawRoundedRect(rect().adjusted(1, 1, -1, -1), 10, 10);
}

void QRemDEpochsOverlayFrame::mousePressEvent(QMouseEvent *event)
{
    if (event->button() == Qt::LeftButton) {
        m_dragOffset = event->pos();
    }
}

void QRemDEpochsOverlayFrame::mouseMoveEvent(QMouseEvent* event)
{
    if (event->buttons() & Qt::LeftButton) {
        // Move the frame relative to its parent (the chart view)
        move(mapToParent(event->pos() - m_dragOffset));
    }
}

QRemDEpochsWidget::QRemDEpochsWidget(QRemDDataSource *sourceEpochs, QWidget *parent)
    : QWidget{parent}
    , m_sourceEpochs(sourceEpochs)
    , m_minX(0.), m_maxX(0.)
    , m_maxYTop(10.), m_maxYBottom(5.)
    , m_autoScroll(true), m_windowSize(2000), m_isFollowingLive(true)
{
    m_seriesRestless = new QLineSeries(this);
    m_seriesVelocity = new QLineSeries(this);
    m_seriesMoves    = new QLineSeries(this);
    m_seriesTrigger  = new QScatterSeries(this);
    m_seriesCeiling = new QLineSeries(this);
    m_seriesBucket  = new QLineSeries(this);

    // Set names for the legend
    m_seriesRestless->setName("Restlessness");
    m_seriesVelocity->setName("Peak Velocity");
    m_seriesMoves->setName("Saccade Count");
    m_seriesCeiling->setName("Blink Ceiling");
    m_seriesBucket->setName("REM Bucket");

    m_seriesTrigger->setName("LED Trigger");
    m_seriesTrigger->setMarkerShape(QScatterSeries::MarkerShapeRectangle);
    m_seriesTrigger->setMarkerSize(10.0);
    m_seriesTrigger->setColor(Qt::red); // Red for the LED fire
    m_seriesTrigger->setBorderColor(Qt::transparent);

    setupLayout();

    m_epochsSeriesDevice = new QRemDEpochSeriesDevice(m_seriesRestless, m_seriesVelocity,
                                                      m_seriesMoves, m_seriesTrigger,
                                                      m_seriesBucket, m_seriesCeiling, this);

    connect(m_scrollbar, &QScrollBar::valueChanged, this, &QRemDEpochsWidget::handleScroll);
    connect(m_epochsSeriesDevice, &QRemDEpochSeriesDevice::dataUpdated, this, &QRemDEpochsWidget::handleDataUpdated);
    connect(m_epochsSeriesDevice, &QRemDEpochSeriesDevice::profileIdentified, this, &QRemDEpochsWidget::handleProfileIdentified);

    // Connect the X-axis of the top chart to the bottom chart
    auto axisXTop = qobject_cast<QValueAxis*>(m_viewTop->chart()->axes(Qt::Horizontal).first());
    auto axisXBottom = qobject_cast<QValueAxis*>(m_viewBottom->chart()->axes(Qt::Horizontal).first());
    connect(axisXTop, &QValueAxis::rangeChanged, axisXBottom, &QValueAxis::setRange);
    connect(axisXBottom, &QValueAxis::rangeChanged, axisXTop, &QValueAxis::setRange);

    m_epochsSeriesDevice->open(QIODevice::WriteOnly);

    m_sourceEpochs->setParent(this);
    m_sourceEpochs->start(m_epochsSeriesDevice);
}

QRemDEpochsWidget::~QRemDEpochsWidget()
{
    m_sourceEpochs->stop();
    m_epochsSeriesDevice->close();
}

void QRemDEpochsWidget::resizeEvent(QResizeEvent *event)
{
    QWidget::resizeEvent(event);

    if (m_overlay) {
        m_overlay->adjustSize(); // Let it shrink-wrap the buttons

        // Geometry: Parent Width - My Width - Margin
        int padding = 15;
        int x = m_viewTop->width() - m_overlay->width() - padding;
        int y = padding;

        m_overlay->move(x, y);
    }
}

void QRemDEpochsWidget::clearCharts()
{
    m_seriesRestless->clear();
    m_seriesVelocity->clear();
    m_seriesMoves->clear();
    m_seriesTrigger->clear();
    m_seriesBucket->clear();  // Don't forget the new ones!
    m_seriesCeiling->clear();

    // Reset the scaling so we don't stay zoomed out
    m_maxYTop = 0;
    m_maxYBottom = 0;
}

void QRemDEpochsWidget::setupLayout()
{
    QVBoxLayout *layout = new QVBoxLayout(this);
    layout->setContentsMargins(0,0,0,0);
    layout->setSpacing(0);

    // --- Top Chart: Intensity Metrics ---
    QChart *topChart = new QChart();
    topChart->addSeries(m_seriesRestless);
    topChart->addSeries(m_seriesVelocity);
    topChart->addSeries(m_seriesCeiling);
    topChart->createDefaultAxes();
    topChart->setTitle("Sleep Intensity (Epochs)");
    topChart->axes(Qt::Horizontal).first()->setTitleText("Epoch (30s)");

    // Set the Ceiling to be a thin, dashed grey line
    QPen ceilingPen(Qt::lightGray);
    ceilingPen.setStyle(Qt::DashLine);
    ceilingPen.setWidth(1);
    m_seriesCeiling->setPen(ceilingPen);

    // --- Bottom Chart: REM Detection Metrics ---
    QChart *bottomChart = new QChart();
    bottomChart->addSeries(m_seriesMoves);
    bottomChart->addSeries(m_seriesTrigger);
    bottomChart->addSeries(m_seriesBucket);
    bottomChart->createDefaultAxes();
    bottomChart->setTitle("Saccades & System Response");

    // Style the Bucket (Thicker Cyan Line)
    QPen bucketPen(Qt::cyan);
    bucketPen.setWidth(2); // Set thickness here
    m_seriesBucket->setPen(bucketPen);

    m_viewTop = new QChartView(topChart);
    m_viewBottom = new QChartView(bottomChart);

    // Optional: Improved rendering for thin lines
    m_viewTop->setRenderHint(QPainter::Antialiasing);
    m_viewBottom->setRenderHint(QPainter::Antialiasing);

    // --- Enable Zooming ---
    // HorizontalZoom allows you to zoom into a specific time window
    // without changing the vertical scale (keeps the "Staircase" height visible).
    m_viewTop->setRubberBand(QChartView::HorizontalRubberBand);
    m_viewBottom->setRubberBand(QChartView::HorizontalRubberBand);

    m_scrollbar = new QScrollBar(Qt::Horizontal, this);

    layout->addWidget(m_viewTop);
    layout->addWidget(m_viewBottom);
    layout->addWidget(m_scrollbar);


    /*m_overlay = new QRemDEpochsOverlayFrame(m_viewTop);
    QVBoxLayout *overLayout = new QVBoxLayout(m_overlay);

    m_followCheck = new QCheckBox("Follow Live");
    QPushButton *btnReset = new QPushButton("Reset Zoom");
    QPushButton *btnJump = new QPushButton("Find Activity");

    // Pure C++ Palette for White Text
    QPalette textPal = m_followCheck->palette();
    textPal.setColor(QPalette::WindowText, Qt::white);
    textPal.setColor(QPalette::ButtonText, Qt::white);

    m_followCheck->setPalette(textPal);
    btnReset->setPalette(textPal);
    btnJump->setPalette(textPal);

    overLayout->addWidget(m_followCheck);
    overLayout->addWidget(btnReset);
    overLayout->addWidget(btnJump);


    // Connections
    connect(btnReset, &QPushButton::clicked, this, [this]() {
        m_viewTop->chart()->zoomReset();
        m_viewBottom->chart()->zoomReset();
        m_followCheck->setChecked(true);
    });*/

    m_overlay = new QRemDEpochsOverlayFrame(m_viewTop);
    QVBoxLayout* overLayout = new QVBoxLayout(m_overlay);

    m_followCheck = new QCheckBox("Follow Live");
    QPushButton* btnReset = new QPushButton("Home View"); // Changed name to imply 'Return'
    QPushButton* btnJump = new QPushButton("Find Activity");

    // High contrast palette (Dark text on light background)
    QPalette darkText;
    darkText.setColor(QPalette::WindowText, Qt::black);
    darkText.setColor(QPalette::ButtonText, Qt::black);

    m_followCheck->setPalette(darkText);
    btnReset->setPalette(darkText);
    btnJump->setPalette(darkText);

    overLayout->addWidget(m_followCheck);
    overLayout->addWidget(btnReset);
    overLayout->addWidget(btnJump);

    connect(btnReset, &QPushButton::clicked, this, [this]() {
        m_isFollowingLive = false;
        if (m_followCheck) m_followCheck->setChecked(false);

        auto axisXTop = qobject_cast<QValueAxis*>(m_viewTop->chart()->axes(Qt::Horizontal).first());
        auto axisXBottom = qobject_cast<QValueAxis*>(m_viewBottom->chart()->axes(Qt::Horizontal).first());

        if (axisXTop && axisXBottom) {
            // 1. Choose a "Major" interval for the full session view
            double interval = 200.0;

            // 2. Snap the VIEW range to these multiples
            // This forces the labels to be nice (e.g., 39800, 40000...)
            double snappedMin = std::floor(m_minX / interval) * interval;
            double snappedMax = std::ceil(m_maxX / interval) * interval;

            // 3. Apply the range and calculate the exact tick count
            int tickCount = static_cast<int>((snappedMax - snappedMin) / interval) + 1;

            axisXTop->setRange(snappedMin, snappedMax);
            axisXTop->setTickCount(tickCount);
            axisXTop->setLabelFormat("%d");

            axisXBottom->setRange(snappedMin, snappedMax);
            axisXBottom->setTickCount(tickCount);
            axisXBottom->setLabelFormat("%d");
        }

        m_viewTop->chart()->zoomReset();
        m_viewBottom->chart()->zoomReset();

        m_scrollbar->blockSignals(true);
        // Align scrollbar to the actual data start, not the snapped start
        m_scrollbar->setValue(static_cast<int>(m_minX));
        m_scrollbar->blockSignals(false);
    });

    connect(m_followCheck, &QCheckBox::toggled, this, [this](bool checked) {
        m_isFollowingLive = checked;
    });

    connect(btnJump, &QPushButton::clicked, this, &QRemDEpochsWidget::jumpToActivity);
}

/*void QRemDEpochsWidget::setupLayout()
{
    QVBoxLayout *layout = new QVBoxLayout(this);

    // --- Top Chart Setup ---
    QChart *topChart = new QChart();
    topChart->setTitle("Sleep Intensity (Epochs)");

    QValueAxis *axisXTop = new QValueAxis(this);
    QValueAxis *axisYTop = new QValueAxis(this);
    topChart->addAxis(axisXTop, Qt::AlignBottom);
    topChart->addAxis(axisYTop, Qt::AlignLeft);

    topChart->addSeries(m_seriesRestless);
    topChart->addSeries(m_seriesVelocity);
    topChart->addSeries(m_seriesCeiling);

    // CRITICAL: Every series must be attached to BOTH axes
    m_seriesRestless->attachAxis(axisXTop);
    m_seriesRestless->attachAxis(axisYTop);
    m_seriesVelocity->attachAxis(axisXTop);
    m_seriesVelocity->attachAxis(axisYTop);
    m_seriesCeiling->attachAxis(axisXTop);
    m_seriesCeiling->attachAxis(axisYTop);

    // Style Ceiling
    QPen ceilingPen(Qt::lightGray);
    ceilingPen.setStyle(Qt::DashLine);
    ceilingPen.setWidth(1);
    m_seriesCeiling->setPen(ceilingPen);

    // --- Bottom Chart Setup ---
    QChart *bottomChart = new QChart();
    bottomChart->setTitle("Saccades & System Response");

    QValueAxis *axisXBottom = new QValueAxis(this);
    QValueAxis *axisYBottom = new QValueAxis(this);
    bottomChart->addAxis(axisXBottom, Qt::AlignBottom);
    bottomChart->addAxis(axisYBottom, Qt::AlignLeft);

    bottomChart->addSeries(m_seriesMoves);
    bottomChart->addSeries(m_seriesTrigger);
    bottomChart->addSeries(m_seriesBucket);

    // CRITICAL: Attach series to axes
    m_seriesMoves->attachAxis(axisXBottom);
    m_seriesMoves->attachAxis(axisYBottom);
    m_seriesTrigger->attachAxis(axisXBottom);
    m_seriesTrigger->attachAxis(axisYBottom);
    m_seriesBucket->attachAxis(axisXBottom);
    m_seriesBucket->attachAxis(axisYBottom);

    // Style Bucket
    QPen bucketPen(Qt::cyan);
    bucketPen.setWidth(2);
    m_seriesBucket->setPen(bucketPen);

    // --- Views and Interactivity ---
    m_viewTop = new QChartView(topChart);
    m_viewBottom = new QChartView(bottomChart);
    m_viewTop->setRenderHint(QPainter::Antialiasing);
    m_viewBottom->setRenderHint(QPainter::Antialiasing);

    m_viewTop->setRubberBand(QChartView::HorizontalRubberBand);
    m_viewBottom->setRubberBand(QChartView::HorizontalRubberBand);

    m_scrollbar = new QScrollBar(Qt::Horizontal, this);

    layout->addWidget(m_viewTop);
    layout->addWidget(m_viewBottom);
    layout->addWidget(m_scrollbar);
}*/

void QRemDEpochsWidget::resetZoom()
{
    // 1. Tell the charts to discard their internal zoom state
    m_viewTop->chart()->zoomReset();
    m_viewBottom->chart()->zoomReset();

    // 2. Resume the 'Follow Live' behavior
    m_isFollowingLive = true;

    // 3. Force the scrollbar to the end and trigger handleScroll()
    // handleScroll() will call updateAxisGrid with our current m_maxY values
    m_scrollbar->setValue(m_scrollbar->maximum());
}

void QRemDEpochsWidget::jumpToActivity()
{
    // 1. Disable live following first
    m_isFollowingLive = false;
    if (m_followCheck) m_followCheck->setChecked(false);

    // 2. Scan for the first sign of activity
    auto points = m_seriesBucket->points();
    for (const QPointF &p : points) {
        if (p.y() > 0.5) {

            // Instead of just p.x() - 50, we round down to the nearest 50.
            // This ensures the labels land on 40500, 40550, etc., instead of 40503.
            double rawStart = p.x() - 50;
            double viewStart = std::floor(rawStart / 50.0) * 50.0;
            double viewEnd = viewStart + 200.0; // Keep a clean, fixed-width window

            // 3. Update BOTH axes to keep them synchronized
            auto axisXTop = qobject_cast<QValueAxis*>(m_viewTop->chart()->axes(Qt::Horizontal).first());
            auto axisXBottom = qobject_cast<QValueAxis*>(m_viewBottom->chart()->axes(Qt::Horizontal).first());

            if (axisXTop && axisXBottom) {
                // By setting a "clean" range here, updateAxisGrid will
                // produce "clean" ticks automatically.
                axisXTop->setRange(viewStart, viewEnd);
                axisXBottom->setRange(viewStart, viewEnd);
            }

            // 4. Update the scrollbar so it reflects the new position
            m_scrollbar->blockSignals(true);
            m_scrollbar->setValue(static_cast<int>(viewStart));
            m_scrollbar->blockSignals(false);

            break;
        }
    }
}

/*void QRemDEpochsWidget::updateAxisGrid(QValueAxis *axis, double minVal, double maxVal, bool isHorizontal)
{
    if (!axis) return;

    if (isHorizontal) {
        // 1. Choose a "Human-Friendly" interval (e.g., 50, 100, 200)
        double range = maxVal - minVal;
        double interval = (range > 1500) ? 200.0 : 50.0;

        // 2. SNAP the boundaries for the GRID logic
        // We find the first "nice" number AFTER minVal
        // and the last "nice" number BEFORE maxVal
        double firstNiceTick = std::ceil(minVal / interval) * interval;
        double lastNiceTick = std::floor(maxVal / interval) * interval;

        // 3. Calculate how many "nice" steps fit between those two
        int tickCount = static_cast<int>((lastNiceTick - firstNiceTick) / interval) + 1;

        // 4. CRITICAL: To make Qt land exactly on those nice numbers,
        // we have to slightly expand the axis range to match the ticks perfectly.
        axis->setRange(firstNiceTick, firstNiceTick + (tickCount - 1) * interval);

        // If the expansion cut off data, we revert to the data range but keep tick math
        if (axis->min() > minVal || axis->max() < maxVal) {
            axis->setRange(minVal, maxVal);
            // With a non-aligned range, ticks will always be slightly messy in Qt Charts.
            // To fix this without changing data, we force a specific tick count:
            axis->setTickCount(tickCount + 1);
        } else {
            axis->setTickCount(tickCount);
        }

        axis->setLabelFormat("%d");

    } else {
        // --- Vertical Logic (Intensity/Bucket) ---
        // Vertical range is usually smaller, so we use a dynamic interval
        double range = maxVal - minVal;
        double vInterval;

        if (range <= 10)       vInterval = 2.0;
        else if (range <= 50)  vInterval = 10.0;
        else if (range <= 200) vInterval = 50.0;
        else                   vInterval = 100.0;

        double cleanMax = std::ceil(maxVal / vInterval) * vInterval;
        int vTicks = static_cast<int>(cleanMax / vInterval) + 1;

        axis->setRange(0, cleanMax); // Vertical usually starts at 0
        axis->setTickCount(vTicks);
        axis->setLabelFormat("%.1f"); // Vertical often needs one decimal
    }
}*/

void QRemDEpochsWidget::updateAxisGrid(QValueAxis *axis, double minVal, double maxVal, bool isHorizontal)
{
    if (!axis) return;

    if (isHorizontal) {
        // --- Horizontal Timeline Logic (Multiples of 50 or 200) ---
        double range = maxVal - minVal;
        double interval = (range > 1500) ? 200.0 : 50.0;

        double cleanMin = std::floor(minVal / interval) * interval;
        double cleanMax = std::ceil(maxVal / interval) * interval;
        int ticks = static_cast<int>((cleanMax - cleanMin) / interval) + 1;

        axis->setRange(cleanMin, cleanMax);
        axis->setTickCount(qMax(2, ticks));
        axis->setLabelFormat("%d");
    }
    else {
        // --- High-Granularity Vertical Logic ---
        double interval;

        if (maxVal <= 6.0)       interval = 1.0;  // 0, 1, 2, 3, 4, 5, 6
        else if (maxVal <= 15.0)  interval = 2.0;  // 0, 2, 4, 6... 14
        else if (maxVal <= 40.0)  interval = 5.0;  // 0, 5, 10, 15, 20, 25, 30, 35, 40
        else if (maxVal <= 100.0) interval = 10.0; // 0, 10, 20... 100
        else if (maxVal <= 500.0) interval = 50.0; // 0, 50, 100... 500
        else                      interval = 100.0;// 0, 100, 200...

        double cleanMax = std::ceil(maxVal / interval) * interval;
        int ticks = static_cast<int>(cleanMax / interval) + 1;

        // Safety check: Qt charts hate tick counts < 2
        if (ticks < 2) ticks = 2;

        axis->setRange(0, cleanMax);
        axis->setTickCount(ticks);
        axis->setLabelFormat("%d");
    }

    // Keep grid lines visible but subtle
    axis->setGridLinePen(QPen(QColor(200, 200, 200, 80)));
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

    double viewMin = static_cast<double>(value);
    double viewMax = viewMin + m_windowSize;

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

void QRemDEpochsWidget::handleDataUpdated(double minX, double maxX, double peakTop, double peakBottom)
{
    m_minX = minX;
    m_maxX = maxX;

    // 1. Top Vertical Axis
    double adjustedTopPeak = qMax(peakTop, 100.0);
    if (adjustedTopPeak > m_maxYTop * 0.9 || m_maxYTop < 1.0) {
        auto axisYTop = qobject_cast<QValueAxis*>(m_viewTop->chart()->axes(Qt::Vertical).first());
        if (axisYTop) {
            updateAxisGrid(axisYTop, 0, adjustedTopPeak * 1.1, false);
            m_maxYTop = axisYTop->max();
        }
    }

    // 2. Bottom Vertical Axis
    double adjustedBottomPeak = qMax(peakBottom, 5.0);
    if (adjustedBottomPeak > m_maxYBottom * 0.9 || m_maxYBottom < 1.0) {
        auto axisYBottom = qobject_cast<QValueAxis*>(m_viewBottom->chart()->axes(Qt::Vertical).first());
        if (axisYBottom) {
            updateAxisGrid(axisYBottom, 0, adjustedBottomPeak + 2, false);
            m_maxYBottom = axisYBottom->max();
        }
    }

    // 3. Sync Horizontal Axes (The Timeline)
    auto axisXTop = qobject_cast<QValueAxis*>(m_viewTop->chart()->axes(Qt::Horizontal).first());
    auto axisXBottom = qobject_cast<QValueAxis*>(m_viewBottom->chart()->axes(Qt::Horizontal).first());

    double windowSize = 200.0;

    if (axisXTop && axisXBottom && m_isFollowingLive) {
        // We use the same 'nice' logic for live updates
        double viewMin = qMax(m_minX, m_maxX - windowSize);
        double viewMax = m_maxX;

        // Pass to updateAxisGrid to ensure labels stay on multiples of 50
        updateAxisGrid(axisXTop, viewMin, viewMax, true);
        updateAxisGrid(axisXBottom, viewMin, viewMax, true);
    }

    // 4. Scrollbar Logic
    m_scrollbar->blockSignals(true);

    // The range must allow the thumb to sit at the 'start' of the window
    int scrollRangeMax = static_cast<int>(qMax(m_minX, m_maxX - windowSize));
    m_scrollbar->setRange(static_cast<int>(m_minX), scrollRangeMax);

    if (m_isFollowingLive) {
        m_scrollbar->setValue(scrollRangeMax);

        // Zoom reset to clear any manual rubber-band zooms while following live
        m_viewTop->chart()->zoomReset();
        m_viewBottom->chart()->zoomReset();
    }
    m_scrollbar->blockSignals(false);
}

void QRemDEpochsWidget::handleProfileIdentified(int profileId)
{
    QString name = getProfileNameFromId(profileId);
    //m_profileLabel->setText(QString("Active Profile: <b>%1</b>").arg(name));

    // Optional: Log the specific restlessness factor for this profile
    // to help you debug the false trigger from this morning.
}

