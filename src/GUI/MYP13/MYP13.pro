QT += quick qml sql core gui
include(src/src.pri)
CONFIG += c++11 disable-desktop lang-all
DEFINES += QT_DEPRECATED_WARNINGS


RESOURCES += qml.qrc

QML_IMPORT_PATH =

QML_DESIGNER_IMPORT_PATH =

target.path = /home/pi/bin

!isEmpty(target.path): INSTALLS += target


DISTFILES += \
    images/paris13.png \

LIBS += -L /usr/local/lib/python3.7m -lpython3.7m
INCLUDEPATH += /usr/include/python3.7m

