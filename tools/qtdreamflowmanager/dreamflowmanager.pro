QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets charts serialport network

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    capturesettingsdialog.cpp \
    commsettingsdialog.cpp \
    main.cpp \
    managermainwindow.cpp \
    remddatafilesource.cpp \
    remddataserialsource.cpp \
    remddataseriesdevice.cpp \
    remddatasource.cpp \
    remddatawidget.cpp

HEADERS += \
    capturesettingsdialog.h \
    commsettingsdialog.h \
    managermainwindow.h \
    remddatafilesource.h \
    remddataserialsource.h \
    remddataseriesdevice.h \
    remddatasource.h \
    remddatawidget.h

FORMS += \
    capturesettingsdialog.ui \
    commsettingsdialog.ui \
    managermainwindow.ui

INCLUDEPATH += \
    /usr/include/x86_64-linux-gnu/c++/11/ \
    /usr/include/c++/11/

LIBS += \
    -L/usr/lib/gcc/x86_64-linux-gnu/11/

TRANSLATIONS += \
    dreamflowmanager_en_US.ts
CONFIG += lrelease
CONFIG += embed_translations

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    resources.qrc
