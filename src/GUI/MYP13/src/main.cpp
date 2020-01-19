#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
//#include<QtWebEngineWidgets/QtWebEngineWidgets>
//#include <QtWebView/QtWebView>
#include "qtquickcontrolsapplication.h"
#include "sqleventmodel.h"
#include "sqloccumodel.h"
#include "load.h"
#include "quotas.h"
#include "mail.h"
#include "jsonparse.h"



int main(int argc, char *argv[])
{
  qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
    QGuiApplication app(argc, argv);
    qApp->setOverrideCursor( QCursor( Qt::BlankCursor ) );
    QQuickView view;
    qmlRegisterType<load>("com.load",1,0,"Loading");
    qmlRegisterType<SqlEventModel>("com.calendar", 1, 0, "SqlEventModel");
    qmlRegisterType<sqloccumodel>("com.occu", 1, 0, "Sqloccumodel");
    qmlRegisterType<quotas>("com.quotas", 1, 0, "Quotas");
    qmlRegisterType<mail>("com.mail", 1, 0, "Mail");
    qmlRegisterType<jsonparse>("com.json", 1, 0, "Json");
    QQmlApplicationEngine engine(QUrl("qrc:/main.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();


}
