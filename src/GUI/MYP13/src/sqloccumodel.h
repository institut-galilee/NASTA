#ifndef SQLOCCUMODEL_H
#define SQLOCCUMODEL_H
#include <QList>
#include <QObject>

class sqloccumodel : public QObject
{

    Q_OBJECT
public:
    sqloccumodel();
     Q_INVOKABLE int occupation(const QString salle);
private:
    static void createConnection();
};

#endif // SQLOCCUMODEL_H




