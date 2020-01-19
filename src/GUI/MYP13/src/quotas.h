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
