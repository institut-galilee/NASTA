#ifndef MAIL_H
#define MAIL_H

#include <QObject>

class mail: public QObject
{
    Q_OBJECT
public:
    mail();
    Q_INVOKABLE void sendmail(const QString mail,const QString msg);
};

#endif // MAIL_H


