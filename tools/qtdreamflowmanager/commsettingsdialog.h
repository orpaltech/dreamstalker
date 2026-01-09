#ifndef COMMSETTINGSDIALOG_H
#define COMMSETTINGSDIALOG_H

#include <QDialog>
#include <QSerialPort>

/****************************************************/

QT_BEGIN_NAMESPACE
namespace Ui {
class CommSettingsDialog;
}
QT_END_NAMESPACE

/****************************************************/

QT_FORWARD_DECLARE_CLASS(QIntValidator)

/****************************************************/

class QCommSettingsDialog : public QDialog
{
    Q_OBJECT

public:
    struct Settings {
        QString name;
        qint32 baudRate;
        QString stringBaudRate;
        QSerialPort::DataBits dataBits;
        QString stringDataBits;
        QSerialPort::Parity parity;
        QString stringParity;
        QSerialPort::StopBits stopBits;
        QString stringStopBits;
        QSerialPort::FlowControl flowControl;
        QString stringFlowControl;
    };

    Settings settings() const;

public:
    explicit QCommSettingsDialog(QWidget *parent = nullptr);
    ~QCommSettingsDialog();

protected:
    void showEvent(QShowEvent *evt);

private slots:
    void showPortInfo(int idx);
    void apply();
    void checkCustomBaudRatePolicy(int idx);
    void checkCustomDevicePathPolicy(int idx);

private:
    void fillPortsParameters();
    void fillPortsInfo();
    void updateSettings();

private:
    Ui::CommSettingsDialog *ui;
    Settings m_currentSettings;
    QIntValidator *m_intValidator;
};

#endif // COMMSETTINGSDIALOG_H
