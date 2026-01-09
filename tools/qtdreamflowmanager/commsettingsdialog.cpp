#include "commsettingsdialog.h"
#include "ui_commsettingsdialog.h"

#include <QIntValidator>
#include <QLineEdit>
#include <QSerialPortInfo>


/****************************************************/

static const char BlankString[] = QT_TRANSLATE_NOOP("CommSettingsDialog", "N/A");

/****************************************************/

QCommSettingsDialog::QCommSettingsDialog(QWidget *parent)
    : QDialog(parent)
    , ui(new Ui::CommSettingsDialog)
    , m_intValidator(new QIntValidator(0, 4000000, this))
{
    ui->setupUi(this);

    ui->baudRateBox->setInsertPolicy(QComboBox::NoInsert);

    connect(ui->applyButton, &QPushButton::clicked,
            this, &QCommSettingsDialog::apply);
    connect(ui->serialPortInfoListBox, &QComboBox::currentIndexChanged,
            this, &QCommSettingsDialog::showPortInfo);
    connect(ui->baudRateBox,  &QComboBox::currentIndexChanged,
            this, &QCommSettingsDialog::checkCustomBaudRatePolicy);
    connect(ui->serialPortInfoListBox, &QComboBox::currentIndexChanged,
            this, &QCommSettingsDialog::checkCustomDevicePathPolicy);
}

QCommSettingsDialog::~QCommSettingsDialog()
{
    delete ui;
}

void QCommSettingsDialog::showEvent(QShowEvent *evt)
{
    QDialog::showEvent(evt);

    fillPortsParameters();
    fillPortsInfo();

    updateSettings();
}

QCommSettingsDialog::Settings QCommSettingsDialog::settings() const
{
    return m_currentSettings;
}

void QCommSettingsDialog::showPortInfo(int idx)
{
    if (idx == -1)
        return;

    const QString blankString = tr(::BlankString);

    const QStringList list = ui->serialPortInfoListBox->itemData(idx).toStringList();
    ui->descriptionLabel->setText(tr("Description: %1").arg(list.value(1, blankString)));
    ui->manufacturerLabel->setText(tr("Manufacturer: %1").arg(list.value(2, blankString)));
    ui->serialNumberLabel->setText(tr("Serial number: %1").arg(list.value(3, blankString)));
    ui->locationLabel->setText(tr("Location: %1").arg(list.value(4, blankString)));
    ui->vidLabel->setText(tr("Vendor Identifier: %1").arg(list.value(5, blankString)));
    ui->pidLabel->setText(tr("Product Identifier: %1").arg(list.value(6, blankString)));
}

void QCommSettingsDialog::apply()
{
    updateSettings();
    hide();
}

void QCommSettingsDialog::checkCustomBaudRatePolicy(int idx)
{
    const bool isCustomBaudRate = !ui->baudRateBox->itemData(idx).isValid();
    ui->baudRateBox->setEditable(isCustomBaudRate);
    if (isCustomBaudRate) {
        ui->baudRateBox->clearEditText();
        QLineEdit *edit = ui->baudRateBox->lineEdit();
        edit->setValidator(m_intValidator);
    }
}

void QCommSettingsDialog::checkCustomDevicePathPolicy(int idx)
{
    const bool isCustomPath = !ui->serialPortInfoListBox->itemData(idx).isValid();
    ui->serialPortInfoListBox->setEditable(isCustomPath);
    if (isCustomPath)
        ui->serialPortInfoListBox->clearEditText();
}

void QCommSettingsDialog::fillPortsParameters()
{
    ui->baudRateBox->addItem(QStringLiteral("9600"), QSerialPort::Baud9600);
    ui->baudRateBox->addItem(QStringLiteral("19200"), QSerialPort::Baud19200);
    ui->baudRateBox->addItem(QStringLiteral("38400"), QSerialPort::Baud38400);
    ui->baudRateBox->addItem(QStringLiteral("115200"), QSerialPort::Baud115200);
    ui->baudRateBox->addItem(tr("Custom"));

    ui->dataBitsBox->addItem(QStringLiteral("5"), QSerialPort::Data5);
    ui->dataBitsBox->addItem(QStringLiteral("6"), QSerialPort::Data6);
    ui->dataBitsBox->addItem(QStringLiteral("7"), QSerialPort::Data7);
    ui->dataBitsBox->addItem(QStringLiteral("8"), QSerialPort::Data8);
    ui->dataBitsBox->setCurrentIndex(3);

    ui->parityBox->addItem(tr("None"), QSerialPort::NoParity);
    ui->parityBox->addItem(tr("Even"), QSerialPort::EvenParity);
    ui->parityBox->addItem(tr("Odd"), QSerialPort::OddParity);
    ui->parityBox->addItem(tr("Mark"), QSerialPort::MarkParity);
    ui->parityBox->addItem(tr("Space"), QSerialPort::SpaceParity);

    ui->stopBitsBox->addItem(QStringLiteral("1"), QSerialPort::OneStop);
    ui->stopBitsBox->addItem(QStringLiteral("2"), QSerialPort::TwoStop);

    ui->flowControlBox->addItem(tr("None"), QSerialPort::NoFlowControl);
    ui->flowControlBox->addItem(tr("RTS/CTS"), QSerialPort::HardwareControl);
    ui->flowControlBox->addItem(tr("XON/XOFF"), QSerialPort::SoftwareControl);
}

void QCommSettingsDialog::fillPortsInfo()
{
    ui->serialPortInfoListBox->clear();
    const QString blankString = tr(::BlankString);
    const auto infos = QSerialPortInfo::availablePorts();

    for (const QSerialPortInfo &info : infos) {
        QStringList list;
        const QString description = info.description();
        const QString manufacturer = info.manufacturer();
        const QString serialNumber = info.serialNumber();
        const auto vendorId = info.vendorIdentifier();
        const auto productId = info.productIdentifier();
        list << info.portName()
             << (!description.isEmpty() ? description : blankString)
             << (!manufacturer.isEmpty() ? manufacturer : blankString)
             << (!serialNumber.isEmpty() ? serialNumber : blankString)
             << info.systemLocation()
             << (vendorId ? QString::number(vendorId, 16) : blankString)
             << (productId ? QString::number(productId, 16) : blankString);

        ui->serialPortInfoListBox->addItem(list.constFirst(), list);
    }

    ui->serialPortInfoListBox->addItem(tr("Custom"));
}

void QCommSettingsDialog::updateSettings()
{
    m_currentSettings.name = ui->serialPortInfoListBox->currentText();

    if (ui->baudRateBox->currentIndex() == 4) {
        m_currentSettings.baudRate = ui->baudRateBox->currentText().toInt();
    } else {
        const auto baudRateData = ui->baudRateBox->currentData();
        m_currentSettings.baudRate = baudRateData.value<QSerialPort::BaudRate>();
    }
    m_currentSettings.stringBaudRate = QString::number(m_currentSettings.baudRate);

    const auto dataBitsData = ui->dataBitsBox->currentData();
    m_currentSettings.dataBits = dataBitsData.value<QSerialPort::DataBits>();
    m_currentSettings.stringDataBits = ui->dataBitsBox->currentText();

    const auto parityData = ui->parityBox->currentData();
    m_currentSettings.parity = parityData.value<QSerialPort::Parity>();
    m_currentSettings.stringParity = ui->parityBox->currentText();

    const auto stopBitsData = ui->stopBitsBox->currentData();
    m_currentSettings.stopBits = stopBitsData.value<QSerialPort::StopBits>();
    m_currentSettings.stringStopBits = ui->stopBitsBox->currentText();

    const auto flowControlData = ui->flowControlBox->currentData();
    m_currentSettings.flowControl = flowControlData.value<QSerialPort::FlowControl>();
    m_currentSettings.stringFlowControl = ui->flowControlBox->currentText();
}
