#ifndef JSONPARSE_H
#define JSONPARSE_H

#include <QObject>

class jsonparse : public QObject
{
    Q_OBJECT
public:
    jsonparse();
    Q_INVOKABLE QString info_titre(const int i);
    Q_INVOKABLE QString info_texte(const int i);



};

#endif // JSONPARSE_H

/*
#ifndef QUOTAS_H
#define QUOTAS_H
#include <QList>
#include <QObject>

class quotas : public QObject
{

    Q_OBJECT
public:
    quotas();
    Q_INVOKABLE int quotas_etu();
    Q_INVOKABLE QString stockage(const QString numero);

private:
    static void createConnection();

};


#endif // QUOTAS_H

*/
