#include "load.h"
#include <stdio.h>
#include <cstdio>
#include <cstring>
#include <unistd.h>
#include <QThread>
#include<QFile>
#include<QMessageBox>
#include<QTextStream>
#include <QFileInfo>
#pragma push_macro("slots")
#undef slots
#include "python3.7/Python.h"
#pragma pop_macro("slots")


load::load()
{
}


bool load::fileExists(){

    bool a=false;
    authentification();
        if(QFile::exists("file.txt"))
       {
            a=true;
             return a;
        }
            return a;
}


QString load::getnume(){

    QFile file("file.txt");
    if(!file.open(QIODevice::ReadOnly)) {
        QMessageBox::information(0, "error", file.errorString());
    }

    QTextStream in(&file);
    QString line = in.readLine();
    file.close();
    return line;
}


QString load::getname(){

    QFile file("file.txt");
    if(!file.open(QIODevice::ReadOnly)) {
        QMessageBox::information(0, "error", file.errorString());
    }

    QTextStream in(&file);
    in.readLine();
    QString line = in.readLine();
    file.close();
    return line;
}


QString load::getmail(){

    QFile file("file.txt");
    if(!file.open(QIODevice::ReadOnly)) {
        QMessageBox::information(0, "error", file.errorString());
    }

    QTextStream in(&file);
    in.readLine();
    in.readLine();
    QString line=in.readLine();
    file.close();
    return line;
}


QString load::getformation(){

    QFile file("file.txt");
    if(!file.open(QIODevice::ReadOnly)) {
        QMessageBox::information(0, "error", file.errorString());
    }

    QTextStream in(&file);
    in.readLine();
    in.readLine();
    in.readLine();
    QString line=in.readLine();
    file.close();
    return line;
}


void load::authentification(){

      char filename[] = "get_information.py";
      FILE* fp;
      Py_Initialize();
      fp = _Py_fopen(filename, "r");
      PyRun_SimpleFile(fp, filename);
      Py_Finalize();

}

void load::disconnect(){
    remove("./file.txt");
}



