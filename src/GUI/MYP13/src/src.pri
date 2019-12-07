QT += quick
!no_desktop: QT += widgets
SOURCES += \
    $$PWD/event.cpp \
    $$PWD/main.cpp \
    $$PWD/sqleventmodel.cpp


HEADERS += \
    $$PWD/event.h \
    $$PWD/qtquickcontrolsapplication.h \
    $$PWD/sqleventmodel.h
