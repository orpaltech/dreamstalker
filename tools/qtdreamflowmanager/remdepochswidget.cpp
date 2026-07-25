#include <QChartView>
#include <QCheckBox>
#include <QDateTimeAxis>
#include <QFrame>
#include <QGraphicsDropShadowEffect>
#include <QGraphicsLayout>
#include <QLineSeries>
#include <QPushButton>
#include <QScatterSeries>
#include <QScrollBar>
#include <QTimeZone>
#include <QValueAxis>
#include <QVBoxLayout>
#include <QApplication>
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
    , m_startTime(QDateTime::currentDateTimeUtc())
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
    connect(m_epochsSeriesDevice, &QRemDEpochSeriesDevice::profileResolved, this, &QRemDEpochsWidget::handleProfileResolved);
    connect(m_epochsSeriesDevice, &QRemDEpochSeriesDevice::startTimeResolved, this, &QRemDEpochsWidget::handleStartTimeResolved);

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
    layout->setContentsMargins(0, 0, 0, 0);
    layout->setSpacing(0);

    // 1. Initialize Charts and Views
    m_viewTop = new QChartView(new QChart());
    m_viewBottom = new QChartView(new QChart());

    // Enable Antialiasing for smoother lines
    m_viewTop->setRenderHint(QPainter::Antialiasing);
    m_viewBottom->setRenderHint(QPainter::Antialiasing);

    // Enable Horizontal RubberBand Zooming
    m_viewTop->setRubberBand(QChartView::HorizontalRubberBand);
    m_viewBottom->setRubberBand(QChartView::HorizontalRubberBand);

    // 2. Setup Axes (Modern QDateTime + QValue)
    QDateTimeAxis *axisXTop = new QDateTimeAxis();
    QDateTimeAxis *axisXBottom = new QDateTimeAxis();
    QValueAxis *axisYTop = new QValueAxis();
    QValueAxis *axisYBottom = new QValueAxis();

    axisXTop->setTickCount(10);
    axisXTop->setFormat("hh:mm");
    axisXBottom->setTickCount(10);
    axisXBottom->setFormat("hh:mm");
    axisXBottom->setTitleText("Time");

    // 3. Configure Top Chart
    m_viewTop->chart()->addAxis(axisXTop, Qt::AlignBottom);
    m_viewTop->chart()->addAxis(axisYTop, Qt::AlignLeft);
    m_viewTop->chart()->addSeries(m_seriesRestless);
    m_viewTop->chart()->addSeries(m_seriesVelocity);
    m_viewTop->chart()->addSeries(m_seriesCeiling);

    m_seriesRestless->attachAxis(axisXTop); m_seriesRestless->attachAxis(axisYTop);
    m_seriesVelocity->attachAxis(axisXTop); m_seriesVelocity->attachAxis(axisYTop);
    m_seriesCeiling->attachAxis(axisXTop);  m_seriesCeiling->attachAxis(axisYTop);

    m_viewTop->chart()->setTitle("Sleep Intensity Metrics");
    m_viewTop->chart()->legend()->setAlignment(Qt::AlignRight);

    // 4. Configure Bottom Chart
    m_viewBottom->chart()->addAxis(axisXBottom, Qt::AlignBottom);
    m_viewBottom->chart()->addAxis(axisYBottom, Qt::AlignLeft);
    m_viewBottom->chart()->addSeries(m_seriesMoves);
    m_viewBottom->chart()->addSeries(m_seriesBucket);
    m_viewBottom->chart()->addSeries(m_seriesTrigger);

    m_seriesMoves->attachAxis(axisXBottom);   m_seriesMoves->attachAxis(axisYBottom);
    m_seriesBucket->attachAxis(axisXBottom);  m_seriesBucket->attachAxis(axisYBottom);
    m_seriesTrigger->attachAxis(axisXBottom); m_seriesTrigger->attachAxis(axisYBottom);

    m_viewBottom->chart()->setTitle("Saccades & System Response");
    m_viewBottom->chart()->legend()->setAlignment(Qt::AlignRight);

    // 5. Synchronize Horizontal Axes
    // When one chart is zoomed or panned, the other follows
    connect(axisXTop, &QDateTimeAxis::rangeChanged, axisXBottom, &QDateTimeAxis::setRange);
    connect(axisXBottom, &QDateTimeAxis::rangeChanged, axisXTop, &QDateTimeAxis::setRange);

    // 6. Scrollbar Setup
    m_scrollbar = new QScrollBar(Qt::Horizontal, this);

    layout->addWidget(m_viewTop, 1); // Give charts equal weight
    layout->addWidget(m_viewBottom, 1);
    layout->addWidget(m_scrollbar);

    // 7. Floating Overlay Setup
    m_overlay = new QRemDEpochsOverlayFrame(m_viewTop);
    QVBoxLayout *overLayout = new QVBoxLayout(m_overlay);

    m_followCheck = new QCheckBox("Follow Live");
    m_followCheck->setChecked(true);
    QPushButton *btnReset = new QPushButton("Home View");
    QPushButton *btnJump = new QPushButton("Find Activity");

    // Set styling for overlay elements
    QPalette pal = m_followCheck->palette();
    pal.setColor(QPalette::WindowText, Qt::black);
    m_followCheck->setPalette(pal);

    overLayout->addWidget(m_followCheck);
    overLayout->addWidget(btnReset);
    overLayout->addWidget(btnJump);

    // 8. Connect Overlay Signals
    connect(m_followCheck, &QCheckBox::toggled, this, [this](bool checked) {
        m_isFollowingLive = checked;
    });

    connect(btnReset, &QPushButton::clicked, this, [this]() {
        m_isFollowingLive = false;
        if (m_followCheck) m_followCheck->setChecked(false);

        // Calculate full range based on detected data min/max
        updateAxisGrid(m_viewTop->chart()->axes(Qt::Horizontal).first(), m_minX, m_maxX, true);

        m_viewTop->chart()->zoomReset();
        m_viewBottom->chart()->zoomReset();

        m_scrollbar->blockSignals(true);
        m_scrollbar->setValue(static_cast<int>(m_minX));
        m_scrollbar->blockSignals(false);

        updateCharts();
    });

    connect(btnJump, &QPushButton::clicked, this, &QRemDEpochsWidget::jumpToActivity);
}

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
    // 1. Disable live following
    m_isFollowingLive = false;
    if (m_followCheck) m_followCheck->setChecked(false);

    // 2. Scan for the trigger
    auto points = m_seriesBucket->points();
    for (const QPointF &p : points) {
        if (p.y() > 0.5) {
            // 3. Convert millisecond X back to Epoch Index
            qint64 triggerMsecs = static_cast<qint64>(p.x());
            QDateTime triggerTime = QDateTime::fromMSecsSinceEpoch(triggerMsecs);

            // Formula: (Seconds since start / 30) + 1
            double triggerIndex = (m_startTime.secsTo(triggerTime) / 30.0) + 1.0;

            // 4. Calculate the window.
            // We want the trigger to be visible, ideally 25% into the view.
            double viewMin = triggerIndex - (m_windowSize * 0.25);

            // 5. CLAMPING: This is the critical part to prevent the "jump to start" bug
            // If the calculated viewMin is beyond the current data, or if we are
            // early in the session, we must stay within [m_minX, m_maxX]
            if (viewMin + m_windowSize > m_maxX) {
                viewMin = qMax(m_minX, m_maxX - m_windowSize);
            }
            if (viewMin < m_minX) {
                viewMin = m_minX;
            }

            double viewMax = viewMin + m_windowSize;

            // If data is very sparse (startup), don't force a huge window
            if (m_maxX - m_minX < m_windowSize) {
                viewMin = m_minX;
                viewMax = m_maxX;
            }

            // 6. Update the Scrollbar position
            m_scrollbar->blockSignals(true);
            m_scrollbar->setValue(static_cast<int>(viewMin));
            m_scrollbar->blockSignals(false);

            // 7. Update Axes directly
            auto axisXTop = m_viewTop->chart()->axes(Qt::Horizontal).first();
            auto axisXBottom = m_viewBottom->chart()->axes(Qt::Horizontal).first();

            updateAxisGrid(axisXTop, viewMin, viewMax, true);
            updateAxisGrid(axisXBottom, viewMin, viewMax, true);

            break;
        }
    }

    updateCharts();
}

void QRemDEpochsWidget::updateCharts()
{
    // Force the Chart to recalculate its internal geometry
    m_viewTop->chart()->layout()->activate();
    m_viewBottom->chart()->layout()->activate();

    // Invalidate the scene and schedule a repaint of the widgets
    m_viewTop->viewport()->update();
    m_viewBottom->viewport()->update();

    // Process events to ensure the UI paints immediately
    // This prevents the "ghosting" or "blank" effect during the transition
    QApplication::processEvents();
}

void QRemDEpochsWidget::updateAxisGrid(QAbstractAxis *axis, double minVal, double maxVal, bool isHorizontal)
{
    if (!axis) return;

    if (isHorizontal) {
        auto timeAxis = qobject_cast<QDateTimeAxis*>(axis);
        if (!timeAxis) return;

        // 1. Calculate the dynamic epoch-based interval based on current range
        double range = maxVal - minVal;
        double epochInterval;

        if (range <= 40.0) {
            // Under 20 minutes of data: Ticks every 2.5 minutes (5 epochs)
            epochInterval = 5.0;
        } else if (range <= 600.0) {
            // Under 5 hours of data: Ticks every 10 minutes (20 epochs)
            epochInterval = 20.0;
        } else {
            // Over 5 hours: Ticks every 1 hour (120 epochs)
            epochInterval = 120.0;
        }

        // 2. Snap the indices to the interval
        // Subtract 1 to align with 1-based data start, then add 1 back to get the epoch index
        double cleanMinIndex = std::floor((minVal - 1) / epochInterval) * epochInterval + 1;
        double cleanMaxIndex = std::ceil((maxVal - 1) / epochInterval) * epochInterval + 1;

        // Ensure we don't collapse the range to zero if min/max snap to the same value
        if (cleanMaxIndex <= cleanMinIndex) cleanMaxIndex = cleanMinIndex + epochInterval;

        // 3. Map snapped Indices to absolute QDateTime
        QDateTime start = m_startTime.addSecs(static_cast<qint64>((cleanMinIndex - 1) * 30));
        QDateTime end = m_startTime.addSecs(static_cast<qint64>((cleanMaxIndex - 1) * 30));

        // 4. Apply range and ticks
        timeAxis->setRange(start, end);

        // Calculate how many tick marks fit in the clean range
        int tickCount = static_cast<int>((cleanMaxIndex - cleanMinIndex) / epochInterval) + 1;
        timeAxis->setTickCount(qMax(2, tickCount));

        // Format: show seconds only if zoomed in very tight (< 5 minutes / 10 epochs)
        timeAxis->setFormat(range < 10.0 ? "hh:mm:ss" : "hh:mm");
    }
    else {
        // Vertical logic for QValueAxis
        auto valueAxis = qobject_cast<QValueAxis*>(axis);
        if (!valueAxis) return;

        double interval;
        if (maxVal <= 15.0)      interval = 2.0;
        else if (maxVal <= 100.0) interval = 10.0;
        else                     interval = 50.0;


        double cleanMax = std::ceil(maxVal / interval) * interval;
        // Add an extra interval if the data is too close to the top
        if (cleanMax - maxVal < (interval * 0.5)) {
            cleanMax += interval;
        }
        valueAxis->setRange(0, qMax(1.0, cleanMax));

        valueAxis->setTickCount(static_cast<int>(cleanMax / interval) + 1);
        valueAxis->setLabelFormat("%d");
    }
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
    // 1. Determine if we are at the end to re-enable live following
    m_isFollowingLive = (value >= m_scrollbar->maximum());

    // 2. The scrollbar 'value' is our window's left edge (minIndex)
    double viewMin = static_cast<double>(value);

    // 3. The right edge is exactly one windowSize away
    double viewMax = viewMin + m_windowSize;

    // 4. Safety Clamp: Ensure we don't show empty space if the
    // scrollbar is somehow pushed beyond the data limits.
    if (viewMax > m_maxX) {
        viewMax = m_maxX;
        viewMin = qMax(m_minX, viewMax - m_windowSize);
    }

    if (viewMin < m_minX) {
        viewMin = m_minX;
        viewMax = viewMin + m_windowSize;
    }

    // 5. Get the horizontal axes
    auto axisXTop = m_viewTop->chart()->axes(Qt::Horizontal).first();
    auto axisXBottom = m_viewBottom->chart()->axes(Qt::Horizontal).first();

    // 6. Update the grid and time labels
    // This converts the clamped indices to QDateTime ranges.
    updateAxisGrid(axisXTop, viewMin, viewMax, true);
    updateAxisGrid(axisXBottom, viewMin, viewMax, true);
}

void QRemDEpochsWidget::handleDataUpdated(double minX, double maxX, double peakTop, double peakBottom)
{
    m_minX = minX;
    m_maxX = maxX;

    // 1. Vertical scaling - Top Chart (Add 10% padding)
    auto axisYTop = qobject_cast<QValueAxis*>(m_viewTop->chart()->axes(Qt::Vertical).first());
    if (axisYTop) {
        double paddedTop = peakTop * 1.1; // Add 10% headroom
        updateAxisGrid(axisYTop, 0, qMax(paddedTop, 100.0), false);
    }

    // 2. Vertical scaling - Bottom Chart (Add padding)
    auto axisYBottom = qobject_cast<QValueAxis*>(m_viewBottom->chart()->axes(Qt::Vertical).first());
    if (axisYBottom) {
        // If peak is 10, paddedBottom becomes 12.
        // updateAxisGrid will then snap it to a clean interval like 14 or 15.
        double paddedBottom = peakBottom + (peakBottom * 0.2);
        updateAxisGrid(axisYBottom, 0, qMax(paddedBottom, 5.0), false);
    }

    // 3. Horizontal Scaling Logic (Grow then Slide)
    double windowSize = static_cast<double>(m_windowSize);

    if (m_isFollowingLive) {
        auto axisXTop = m_viewTop->chart()->axes(Qt::Horizontal).first();
        auto axisXBottom = m_viewBottom->chart()->axes(Qt::Horizontal).first();

        double viewMin, viewMax;

        // If total data span is less than windowSize, don't show empty space.
        // This prevents the "squashed data" look at startup.
        if ((m_maxX - m_minX) < windowSize) {
            viewMin = m_minX;
            viewMax = qMax(m_minX + 1.0, m_maxX); // Ensure range is valid (>0)
        } else {
            // Once data exceeds window, follow the tail (Live mode)
            viewMin = m_maxX - windowSize;
            viewMax = m_maxX;
        }

        // Update both axes to keep them in sync
        updateAxisGrid(axisXTop, viewMin, viewMax, true);
        updateAxisGrid(axisXBottom, viewMin, viewMax, true);
    }

    // 4. Scrollbar Management
    m_scrollbar->blockSignals(true);

    // If data is smaller than window, max scroll is just minX (no scrolling needed)
    int scrollRangeMax = static_cast<int>(qMax(m_minX, m_maxX - windowSize));

    m_scrollbar->setRange(static_cast<int>(m_minX), scrollRangeMax);

    if (m_isFollowingLive) {
        m_scrollbar->setValue(scrollRangeMax);

        // Reset zoom to clear any manual rubber-banding during live updates
        m_viewTop->chart()->zoomReset();
        m_viewBottom->chart()->zoomReset();
    }

    m_scrollbar->blockSignals(false);
}

void QRemDEpochsWidget::handleProfileResolved(int profileId)
{
    QString name = getProfileNameFromId(profileId);
    //m_profileLabel->setText(QString("Active Profile: <b>%1</b>").arg(name));

    // Optional: Log the specific restlessness factor for this profile
    // to help you debug the false trigger from this morning.
}

void QRemDEpochsWidget::handleStartTimeResolved(const QDateTime& startTime)
{
    m_startTime = startTime;
}
