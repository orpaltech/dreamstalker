#include "capturesettingsdialog.h"
#include "ui_capturesettingsdialog.h"

#include <QStandardPaths>
#include <QFileDialog>


/****************************************************/

QCaptureSettingsDialog::QCaptureSettingsDialog(QWidget *parent)
    : QDialog(parent)
    , ui(new Ui::CaptureSettingsDialog)
{
    ui->setupUi(this);

    connect(ui->applyButton, &QPushButton::clicked,
            this, &QCaptureSettingsDialog::apply);
    connect(ui->captureFolderButton, &QToolButton::clicked,
            this, &QCaptureSettingsDialog::selectCaptureFolder);

    QStringList homePath = QStandardPaths::standardLocations(QStandardPaths::HomeLocation);
    ui->captureFolderLineEdit->setText(homePath.first());
}

QCaptureSettingsDialog::~QCaptureSettingsDialog()
{
    delete ui;
}

QCaptureSettingsDialog::Settings QCaptureSettingsDialog::settings() const
{
    return m_currentSettings;
}

void QCaptureSettingsDialog::selectCaptureFolder()
{
    QStringList homePath = QStandardPaths::standardLocations(QStandardPaths::HomeLocation);

    QString captureDir = QFileDialog::getExistingDirectory(this,
                                                           tr("Select Capture Folder"),
                                                           homePath.first(),
                                                           QFileDialog::ShowDirsOnly | QFileDialog::DontResolveSymlinks);

    if (!captureDir.isEmpty())
        ui->captureFolderLineEdit->setText(captureDir);
}

void QCaptureSettingsDialog::apply()
{
    updateSettings();
    hide();
}

void QCaptureSettingsDialog::updateSettings()
{
    m_currentSettings.captureDirectory = ui->captureFolderLineEdit->text();
}
