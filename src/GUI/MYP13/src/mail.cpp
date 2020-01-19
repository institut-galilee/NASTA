#include "mail.h"
#include <cstring>
#include <stdio.h>
#include <iostream>
#pragma push_macro("slots")
#undef slots
#include "python3.7/Python.h"
#pragma pop_macro("slots")

mail::mail()
{
}

void mail::sendmail(const QString mail,const QString msg){
        PyObject *pName, *pModule, *pFunc;
        PyObject *pArgs, *pValue;
        Py_Initialize();
        PyRun_SimpleString("import sys");
        PyRun_SimpleString("sys.path.append(\".\")");

        pName = PyUnicode_FromString("mail");
        /* Error checking of pName left out */

        pModule = PyImport_Import(pName);
        Py_DECREF(pName);

        if (pModule != nullptr) {
            pFunc = PyObject_GetAttrString(pModule, "send_mail");

            if (pFunc && PyCallable_Check(pFunc)) {
                pArgs = PyTuple_New(2);
                pValue = PyUnicode_FromString(mail.toLocal8Bit().data());

                PyTuple_SetItem(pArgs, 0, pValue);
                pValue = PyUnicode_FromString(msg.toLocal8Bit().data());
                PyTuple_SetItem(pArgs, 1, pValue);
                PyObject_CallObject(pFunc, pArgs);
            }
            else {
                if (PyErr_Occurred())
                    PyErr_Print();
                fprintf(stderr, "Cannot find function\n");
            }
            Py_XDECREF(pFunc);
            Py_DECREF(pModule);
        }
        else {
            PyErr_Print();
            fprintf(stderr, "Failed to load \n");
        }
      Py_FinalizeEx();
}
