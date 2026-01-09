#ifndef MANAGERMAINWINDOW_H
#define MANAGERMAINWINDOW_H

#include <QMainWindow>
#include <QSerialPort>

/****************************************************/

QT_BEGIN_NAMESPACE
namespace Ui {
class ManagerMainWindow;
}
QT_END_NAMESPACE

/****************************************************/

QT_FORWARD_DECLARE_CLASS(QLabel)
QT_FORWARD_DECLARE_CLASS(QFile)
QT_FORWARD_DECLARE_CLASS(QCommSettingsDialog)
QT_FORWARD_DECLARE_CLASS(QCaptureSettingsDialog)
QT_FORWARD_DECLARE_CLASS(QRemDDataWidget)
QT_FORWARD_DECLARE_CLASS(QRemDDataSource)

/****************************************************/

class QManagerMainWindow : public QMainWindow
{
    Q_OBJECT

public:
    QManagerMainWindow(QWidget *parent = nullptr);
    ~QManagerMainWindow();

private slots:
    void about();
    void startDataCapture();
    void stopDataCapture();
    void onSerialData();
    void onSerialError(QSerialPort::SerialPortError error);
    void loadDataFromFile();
    void loadDataFromDevice();
    void toggleDataChart();
    void onDataSourceStopped(int error, const QString& message);


private:
    void initActionsConnections();
    void showStatusMessage(const QString &message);
    bool openSerialPort();
    void closeSerialPort();
    void createDataWidget(QRemDDataSource *dataSource);
    void deleteDataWidget();

private:
    Ui::ManagerMainWindow *m_ui;
    QRemDDataWidget *m_dataWidget;
    QCommSettingsDialog *m_commSettings;
    QCaptureSettingsDialog *m_captureSettings;
    QSerialPort *m_serialPort;
    QFile       *m_outputDataFile;
    QLabel      *m_status;
};
#endif // MANAGERMAINWINDOW_H
