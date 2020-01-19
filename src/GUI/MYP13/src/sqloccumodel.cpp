#include "sqloccumodel.h"
#include <QDebug>
#include <QFileInfo>
#include <QSqlError>
#include <QSqlQuery>

sqloccumodel::sqloccumodel()
{
   createConnection();
}

int sqloccumodel::occupation(const QString salle){
  int v;
    const QString queryStr = QString::fromLatin1("SELECT * FROM salleinfo WHERE salle == '%1' ").arg(salle);
    QSqlQuery query(queryStr);
    if (!query.exec())
        qFatal("Query failed");
    else{
        query.next();
        v=query.value("occupation").toInt();
    }
    return v;


}

void sqloccumodel::createConnection()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("./occupation.db");
    if (!db.open()) {
        qFatal("Cannot open database");
        //return;
    }

    return;
}

