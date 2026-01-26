#include <QLabel>
#include <QMessageBox>
#include <QFileDialog>
#include <QStandardPaths>
#include <QHostInfo>
#include <QToolButton>

#include "managermainwindow.h"
#include "ui_managermainwindow.h"
#include "commsettingsdialog.h"
#include "capturesettingsdialog.h"
#include "remdepochswidget.h"
#include "remdsampleswidget.h"
#include "remddatafilesource.h"
#include "remddataserialsource.h"


/****************************************************/

QManagerMainWindow::QManagerMainWindow(QWidget *parent)
    : QMainWindow(parent)
    , m_ui(new Ui::ManagerMainWindow)
    , m_activeWidget(nullptr)
    , m_commSettings(new QCommSettingsDialog(this))
    , m_captureSettings(new QCaptureSettingsDialog(this))
    , m_serialPort(new QSerialPort(this))
    , m_outputDataFile(new QFile(this))
    , m_status(new QLabel)
{
    m_ui->setupUi(this);

    QMenu *popupMenu = new QMenu(this);
    popupMenu->addAction(m_ui->dropdownVisualSamplesFromFile);
    popupMenu->addAction(m_ui->dropdownVisualEpochsFromFile);
    QToolButton *btn = qobject_cast<QToolButton*>(m_ui->toolBar->widgetForAction(m_ui->dropdownVisualFromFile));
    if (btn) {
        btn->setMenu(popupMenu);
        btn->setPopupMode(QToolButton::InstantPopup);
    }

    m_ui->actionCaptureStart->setEnabled(true);
    m_ui->actionCaptureStop->setEnabled(false);
    m_ui->actionCommSettings->setEnabled(true);
    m_ui->actionCaptureSettings->setEnabled(true);
    m_ui->actionQuit->setEnabled(true);

    m_ui->statusBar->addWidget(m_status);

    initActionsConnections();
}

QManagerMainWindow::~QManagerMainWindow()
{
    /* NOTE: avoid autodelete because signal/slot call fails */
    deleteActiveWidget();

    delete m_ui;
}

void QManagerMainWindow::onDataSourceStopped(int error, const QString& message)
{
    if (error != 0)
        QMessageBox::critical(this, tr("Critical Error"), message);

    m_ui->actionVisualSamplesFromDevice->setChecked(false);

    closeSerialPort();
}

void QManagerMainWindow::deleteActiveWidget()
{
    if (m_activeWidget) {
        m_ui->verticalLayout->removeWidget(m_activeWidget);
        delete m_activeWidget;
        m_activeWidget = nullptr;
    }
}

void QManagerMainWindow::createSamplesWidget(QRemDDataSource *dataSource)
{
    deleteActiveWidget();

    m_activeWidget = new QRemDSamplesWidget(dataSource);
    m_ui->verticalLayout->addWidget(m_activeWidget);
    m_ui->actionVisualToggleChart->setChecked(true);
    m_activeWidget->show();
}

void QManagerMainWindow::createEpochsWidget(QRemDDataSource *dataSource)
{
    deleteActiveWidget();

    m_activeWidget = new QRemDEpochsWidget(dataSource);
    m_ui->verticalLayout->addWidget(m_activeWidget);
    m_ui->actionVisualToggleChart->setChecked(true);
    m_activeWidget->show();
}

void QManagerMainWindow::loadSamplesFromFile()
{
    const QCaptureSettingsDialog::Settings cs = m_captureSettings->settings();
    QString dataFileName;

    dataFileName = QFileDialog::getOpenFileName(this, tr("Select REMD Sample File"),
                                                cs.captureDirectory,
                                                tr("REMD Sample Files (*.hex *.HEX);;REMD Bin Files (*.bin *.BIN)"));
    if (dataFileName.isEmpty())
        return;

    QRemDDataSource *dataSource = new QRemDDataFileSource(dataFileName);
    createSamplesWidget(dataSource);
}

void QManagerMainWindow::loadEpochsFromFile()
{
    const QCaptureSettingsDialog::Settings cs = m_captureSettings->settings();
    QString dataFileName;

    dataFileName = QFileDialog::getOpenFileName(this, tr("Select REMD Epoch File"),
                                                cs.captureDirectory,
                                                tr("REMD Epoch Files (*.dat *.DAT)"));
    if (dataFileName.isEmpty())
        return;

    QRemDDataSource *dataSource = new QRemDDataFileSource(dataFileName);
    createEpochsWidget(dataSource);
}

void QManagerMainWindow::loadSamplesFromSerial()
{
    if (m_ui->actionVisualSamplesFromDevice->isChecked()) {
        if (!openSerialPort()) {
            m_ui->actionVisualSamplesFromDevice->setChecked(false);
            return;
        }

        QRemDDataSource *dataSource = new QRemDDataSerialSource(m_serialPort);
        createSamplesWidget(dataSource);

        connect(dataSource, &QRemDDataSource::dataSourceStopped, this, &QManagerMainWindow::onDataSourceStopped,
                (Qt::ConnectionType)(Qt::DirectConnection | Qt::SingleShotConnection));
    } else {
        deleteActiveWidget();
    }
}

void QManagerMainWindow::toggleActiveWidget()
{
    if (m_activeWidget == nullptr)
        return;

    if (m_ui->actionVisualToggleChart->isChecked())
        m_activeWidget->show();
    else
        m_activeWidget->hide();
}

bool QManagerMainWindow::openSerialPort()
{
    const QCommSettingsDialog::Settings p = m_commSettings->settings();

    m_serialPort->setPortName(p.name);
    m_serialPort->setBaudRate(p.baudRate);
    m_serialPort->setDataBits(p.dataBits);
    m_serialPort->setParity(p.parity);
    m_serialPort->setStopBits(p.stopBits);
    m_serialPort->setFlowControl(p.flowControl);

    if (m_serialPort->open(QIODevice::ReadOnly)) {

        m_ui->actionCaptureStart->setEnabled(false);
        m_ui->actionCaptureStop->setEnabled(true);
        m_ui->actionCommSettings->setEnabled(false);
        m_ui->actionCaptureSettings->setEnabled(false);

        showStatusMessage(tr("Connected to %1 : %2, %3, %4, %5, %6")
                              .arg(p.name, p.stringBaudRate, p.stringDataBits,
                                   p.stringParity, p.stringStopBits, p.stringFlowControl));
        return true;
    } else {

        QMessageBox::critical(this, tr("Critical Error"), m_serialPort->errorString());

        showStatusMessage(tr("Serial Port Error"));
        return false;
    }
}

void QManagerMainWindow::closeSerialPort()
{
    if (m_serialPort->isOpen())
        m_serialPort->close();

    m_ui->actionCaptureStart->setEnabled(true);
    m_ui->actionCaptureStop->setEnabled(false);
    m_ui->actionCommSettings->setEnabled(true);
    m_ui->actionCaptureSettings->setEnabled(true);

    showStatusMessage(tr("Disconnected"));
}

void QManagerMainWindow::startDataCapture()
{
    const QCaptureSettingsDialog::Settings c = m_captureSettings->settings();
    QString outputFileName = QDir(c.captureDirectory).filePath("%1_%2.remd")
                               .arg(QHostInfo::localHostName())
                               .arg(QDateTime::currentDateTime().toString("ddMMyyyy-hhmmss"));
    m_outputDataFile->setFileName(outputFileName);

    if (!m_outputDataFile->open(QIODevice::WriteOnly | QIODevice::Truncate)) {
        QMessageBox::critical(this, tr("Error"), m_outputDataFile->errorString());
        return;
    }

    if (!openSerialPort()) {
        stopDataCapture();
        return;
    }

    connect(m_serialPort, &QSerialPort::errorOccurred, this, &QManagerMainWindow::onSerialError);
    connect(m_serialPort, &QSerialPort::readyRead, this, &QManagerMainWindow::onSerialData);
}

void QManagerMainWindow::stopDataCapture()
{
    if (m_outputDataFile->isOpen())
        m_outputDataFile->close();

    closeSerialPort();

    disconnect(m_serialPort, &QSerialPort::errorOccurred, this, &QManagerMainWindow::onSerialError);
    disconnect(m_serialPort, &QSerialPort::readyRead, this, &QManagerMainWindow::onSerialData);
}

void QManagerMainWindow::onSerialData()
{
    quint16 sample;
    quint64 count = (m_serialPort->bytesAvailable() / sizeof(quint16)) * sizeof(quint16);
    const QByteArray bytes = m_serialPort->read(count);
    if (m_outputDataFile->isOpen()) {

        /* Store to the file */
        QDataStream dataStream(bytes);
        dataStream.setByteOrder(QDataStream::LittleEndian);

        QTextStream textStream(m_outputDataFile);
        while(!dataStream.atEnd()) {
            dataStream >> sample;
            textStream << Qt::hex << qSetFieldWidth(4) << qSetPadChar('0') << Qt::noshowbase << Qt::uppercasedigits << sample;
        }
    }
}

void QManagerMainWindow::onSerialError(QSerialPort::SerialPortError error)
{
    if (error == QSerialPort::ResourceError) {
        QMessageBox::critical(this, tr("Critical Error"), m_serialPort->errorString());
        stopDataCapture();
    }
}

void QManagerMainWindow::about()
{
    QMessageBox::about(this, tr("About DreamFlow Device Manager"),
                       tr("The <b>DreamFlow Device Manager</b> application allows for "
                          "controlling and managing DreamFlow-family devices."));
}

void QManagerMainWindow::initActionsConnections()
{
    connect(m_ui->actionCaptureStart, &QAction::triggered, this, &QManagerMainWindow::startDataCapture);
    connect(m_ui->actionCaptureStop, &QAction::triggered, this, &QManagerMainWindow::stopDataCapture);
    connect(m_ui->actionQuit, &QAction::triggered, this, &QManagerMainWindow::close);
    connect(m_ui->actionCommSettings, &QAction::triggered, m_commSettings, &QCommSettingsDialog::show);
    connect(m_ui->actionCaptureSettings, &QAction::triggered, m_captureSettings, &QCaptureSettingsDialog::show);
    connect(m_ui->actionVisualToggleChart, &QAction::triggered, this, &QManagerMainWindow::toggleActiveWidget);
    connect(m_ui->actionVisualSamplesFromFile, &QAction::triggered, this, &QManagerMainWindow::loadSamplesFromFile);
    connect(m_ui->dropdownVisualSamplesFromFile, &QAction::triggered, this, &QManagerMainWindow::loadSamplesFromFile);
    connect(m_ui->actionVisualEpochsFromFile, &QAction::triggered, this, &QManagerMainWindow::loadEpochsFromFile);
    connect(m_ui->dropdownVisualEpochsFromFile, &QAction::triggered, this, &QManagerMainWindow::loadEpochsFromFile);
    connect(m_ui->actionVisualSamplesFromDevice, &QAction::triggered, this, &QManagerMainWindow::loadSamplesFromSerial);
    connect(m_ui->actionAbout, &QAction::triggered, this, &QManagerMainWindow::about);
}

void QManagerMainWindow::showStatusMessage(const QString &message)
{
    m_status->setText(message);
}
