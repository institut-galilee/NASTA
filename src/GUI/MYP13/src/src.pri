QT += quick
!no_desktop: QT += widgets
SOURCES += \
    $$PWD/event.cpp \
    $$PWD/jsonparse.cpp \
    $$PWD/load.cpp \
    $$PWD/mail.cpp \
    $$PWD/main.cpp \
    $$PWD/quotas.cpp \
    $$PWD/sqleventmodel.cpp \
    $$PWD/sqloccumodel.cpp


HEADERS += \
    $$PWD/event.h \
    $$PWD/jsonparse.h \
    $$PWD/load.h \
    $$PWD/mail.h \
    $$PWD/qtquickcontrolsapplication.h \
    $$PWD/quotas.h \
    $$PWD/sqleventmodel.h \
    $$PWD/sqloccumodel.h

