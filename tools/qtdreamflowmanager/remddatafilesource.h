#ifndef REMDDATAFILESOURCE_H
#define REMDDATAFILESOURCE_H

#include <QThread>
#include "remddatasource.h"

/****************************************************/

QT_FORWARD_DECLARE_CLASS(QFile)

/****************************************************/

class QRemDDataFileSourceThread : public QThread
{
    Q_OBJECT
    void run() override;
public:
    explicit QRemDDataFileSourceThread(const QString& dataFileName, QObject *parent = nullptr);
    ~QRemDDataFileSourceThread();

    enum class DataFileType { None, SampleHex, SampleBin, Epochs };

signals:
    void dataSamplesReady(const QByteArray& samples);
    void logHeaderParsed(quint8 profileId);

private:
    quint16 readSampleHex();
    quint16 readSampleBin();

private:
    DataFileType    m_fileType;
    QFile           *m_dataFile;
    int             m_profileId;
};

/****************************************************/

class QRemDDataFileSource : public QRemDDataSource
{
    Q_OBJECT
public:
    explicit QRemDDataFileSource(const QString& dataFileName, QObject *parent = nullptr);
    ~QRemDDataFileSource();

// QRemDDataSource
    virtual bool start(QIODevice *outputDevice);
    virtual void stop();

public slots:
    void handleDataSamples(const QByteArray& samples);
    void handleLogHeaderParsed(quint8 profileId);

private:
    QRemDDataFileSourceThread *m_workerThread;
    QIODevice *m_outputDevice;
};

#endif // REMDDATAFILESOURCE_H
