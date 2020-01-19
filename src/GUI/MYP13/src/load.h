#ifndef LOAD_H
#define LOAD_H

#include <QObject>

class load : public QObject
{
     Q_OBJECT
public:
    load();
       Q_INVOKABLE bool fileExists();
        Q_INVOKABLE QString getnume();
       Q_INVOKABLE QString getname();
       Q_INVOKABLE QString getmail();
       Q_INVOKABLE QString getformation();
        Q_INVOKABLE void disconnect();

private:
    void authentification();

};

#endif // LOAD_H
