#include "quotas.h"
#include <QDebug>
#include <QFileInfo>
#include <QSqlError>
#include <QSqlQuery>
#include<stdio.h>
#include <iostream>
#include <string>

quotas::quotas()
{
   createConnection();
}

int quotas::quotas_etu()//int num)
{
    int v;
    const QString queryStr = QString::fromLatin1("SELECT * FROM quotas WHERE numetu == 11707756 ");//.arg(num);
    QSqlQuery query(queryStr);
    if (!query.exec())
        qFatal("Query failed");
    else{
        query.next();
        v=query.value("restant").toInt();
    }
    return v;

}
void quotas::createConnection()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("./quotas.db");
    if (!db.open()) {
        qFatal("Cannot open database");
        //return;
    }

    return;
}

QString quotas::stockage(const QString numero)
{
      FILE *in;
      char tmp[256];
      in =fopen("utilisateurs-zfs.log","r");

      if (in==nullptr){
               perror("Error opening input or output file ");
               exit(EXIT_FAILURE);
      }

      while(!feof(in)){
             memset(tmp,0x00,sizeof(tmp));
             if(fgets(tmp,255,in)!=nullptr){
                  if(strstr(tmp,numero.toLocal8Bit())!=nullptr){
                      return tmp;
                  }
             }
      }
      fclose(in);
      return nullptr;
}

