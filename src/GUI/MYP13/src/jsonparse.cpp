#include "jsonparse.h"

#include <QTextEdit>   // Nous allons tout de même afficher le contenu du fichier
#include <QString>     // Stocke le contenu du fichier
#include <QVariantMap>
#include <QMapIterator>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonParseError>
#include <QDebug>
#include <QJsonValue>
#include <QTextStream>
#include <QInputDialog>
#include <QIODevice>
#include <QFile>

jsonparse::jsonparse()
{


}

QString jsonparse::info_titre(const int i)
{

    QFile file_obj("info.json");
    file_obj.open(QFile::ReadOnly);

    QTextStream file_text(&file_obj);
    QString json_string;
    json_string = file_text.readAll();
    file_obj.close();
    QByteArray json_bytes = json_string.toLocal8Bit();

    QJsonDocument json_doc= QJsonDocument::fromJson(json_bytes);


    QString titre = json_doc.object().value("html").toObject().value("body").toObject().value("div").toArray()[1].toObject().value("div").toArray()[i].toObject().value("div").toArray()[1].toObject().value("h2").toObject().value("#text").toString();



//html body div[1]  div[i] div[1] h2 #text
 //html body div[1]  div[i] div[1] div #text

    return  titre;

}


QString jsonparse::info_texte(const int i)
{

    QFile file_obj("info.json");
    file_obj.open(QFile::ReadOnly);

    QTextStream file_text(&file_obj);
    QString json_string;
    json_string = file_text.readAll();
    file_obj.close();
    QByteArray json_bytes = json_string.toLocal8Bit();

    QJsonDocument json_doc= QJsonDocument::fromJson(json_bytes);


    QString titre = json_doc.object().value("html").toObject().value("body").toObject().value("div").toArray()[1].toObject().value("div").toArray()[i].toObject().value("div").toArray()[1].toObject().value("div").toObject().value("#text").toString();



//html body div[1]  div[i] div[1] h2 #text
 //html body div[1]  div[i] div[1] div #text

    return  titre;

}




