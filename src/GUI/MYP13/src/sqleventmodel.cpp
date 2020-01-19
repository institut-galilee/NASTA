#include "sqleventmodel.h"

#include <QDebug>
#include <QFileInfo>
#include <QSqlError>
#include <QSqlQuery>

SqlEventModel::SqlEventModel()
{
    createConnection();
}

QList<QObject*> SqlEventModel::eventsForDate(const QDate &date)
{
    const QString queryStr = QString::fromLatin1("SELECT * FROM hyperplanning WHERE '%1' >= startdate AND '%1' <= enddate order by startdate,starthour").arg(date.toString("yyyy-MM-dd"));
    QSqlQuery query(queryStr);
    if (!query.exec())
        qFatal("Query failed");

    QList<QObject*> events;
    while (query.next()) {
        Event *event = new Event(this);
        event->setName(query.value("description").toString());

        QDateTime startDate;
        startDate.setDate(query.value("startdate").toDate());
        startDate.setTime(query.value("starthour").toTime().addSecs(3600));
       event->setStartDate(startDate);


       QDateTime endDate;
        endDate.setDate(query.value("enddate").toDate());
        endDate.setTime(query.value("endhour").toTime().addSecs(3600));
        event->setEndDate(endDate);

        events.append(event);
    }

    return events;
}

void SqlEventModel::createConnection()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("./basededonnees.db");
    if (!db.open()) {
        qFatal("Cannot open database");
        //return;
    }

    return;
}
