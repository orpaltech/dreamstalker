#ifndef CAPTURESETTINGSDIALOG_H
#define CAPTURESETTINGSDIALOG_H

#include <QDialog>

/****************************************************/

QT_BEGIN_NAMESPACE
namespace Ui {
class CaptureSettingsDialog;
}
QT_END_NAMESPACE

/****************************************************/

class QCaptureSettingsDialog : public QDialog
{
    Q_OBJECT
public:
    struct Settings {
        QString captureDirectory;
    };

    Settings settings() const;

public:
    explicit QCaptureSettingsDialog(QWidget *parent = nullptr);
    ~QCaptureSettingsDialog();

private slots:
    void apply();
    void selectCaptureFolder();

private:
    void updateSettings();

private:
    Ui::CaptureSettingsDialog *ui;
    Settings m_currentSettings;
};

#endif // CAPTURESETTINGSDIALOG_H
