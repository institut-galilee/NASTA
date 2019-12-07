QT += quick webenginewidgets webengine qml sql
include(src/src.pri)
CONFIG += c++11
DEFINES += QT_DEPRECATED_WARNINGS


RESOURCES += qml.qrc

QML_IMPORT_PATH =

QML_DESIGNER_IMPORT_PATH =

target.path = /tmp/$${TARGET}/bin

!isEmpty(target.path): INSTALLS += target


DISTFILES += \
    images/paris13.png \



