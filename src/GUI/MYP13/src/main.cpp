#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include<QtWebEngineWidgets/QtWebEngineWidgets>
#include "qtquickcontrolsapplication.h"
#include "sqleventmodel.h"



int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
    QGuiApplication app(argc, argv);
    QQuickView view;
    qmlRegisterType<SqlEventModel>("org.qtproject.examples.calendar", 1, 0, "SqlEventModel");
    QQmlApplicationEngine engine(QUrl("qrc:/main.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();


}
