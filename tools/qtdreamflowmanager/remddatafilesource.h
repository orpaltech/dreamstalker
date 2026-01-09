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

signals:
    void dataSamplesReady(const QByteArray& samples);

private:
    QFile *m_dataFile;
};

/****************************************************/

class QRemDDataFileSource : public QRemDDataSource
{
    Q_OBJECT
public:
    explicit QRemDDataFileSource(const QString& dataFileName, QObject *parent = nullptr);
    ~QRemDDataFileSource();

// QRemDDataSource
    virtual bool start(QIODevice *destDevice);
    virtual void stop();

public slots:
    void handleDataSamples(const QByteArray& samples);

private:
    QRemDDataFileSourceThread *m_workerThread;
    QIODevice *m_destDevice;
};

#endif // REMDDATAFILESOURCE_H
