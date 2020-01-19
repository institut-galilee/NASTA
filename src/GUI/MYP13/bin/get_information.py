import sys,os
import time
import sqlite3
from pysqlcipher3 import dbapi2 as sqlcipher


try:
    os.system("python3 Read.py")
    try:
        with open("identifiant.txt","r") as myfile:
            ID = myfile.readline()
            if(ID!="Failed"):
                LDAPHost = "ldap://192.168.43.215:389"
                os.system('ldapsearch -H ' + LDAPHost + ' -b "dc=localhost" ' + ' -x st="' + ID + '" > toutesdonnees.txt')
                a=1
            else:
                os.system("rm identifiant.txt")
                a=0   
    except IOError as e:
        self.log.error("Exception open file :" % e)
except IOError as f:
    self.log.error("Exception when running python3 Read.py" % f)

if(a!=0):
    try:
        counter =0 #Ce compteur va nous permettre de savoir si toutes les informations ont bien été récupéré.
        with open("toutesdonnees.txt","r") as myfile: #le fichier txt contenant le resutlat de la requete ldapsearch.
            line=myfile.read()
            tab_split = line.split("\n")
            name=""
            formation=""
            mail=""
            student_number=""
            i = 0
            while i < len(tab_split):
                id_name=tab_split[i].split(': ')
                if(id_name[0]=='cn'):
                    name=id_name[1]
                    counter=counter +1
                id_formation=tab_split[i].split(': ')
                if(id_formation[0]=='description'):
                    formation=id_formation[1]
                    counter=counter +1
                id_mail=tab_split[i].split(': ')
                if(id_mail[0]=='title'):
                    mail=id_mail[1]
                    counter=counter +1
                id_numero=tab_split[i].split(': ')
                if(id_numero[0]=='telexNumber'):
                    student_number=id_numero[1]
                    counter=counter +1
        
                if(counter==4): 
                    try:
                        with open("file.txt","w") as myfile:
                            myfile.write(student_number+"\n")
                            myfile.write(name+"\n")
                            myfile.write(mail+"\n")
                            myfile.write(formation+"\n")
                            db = sqlcipher.connect('pass.db')
                            db.execute('pragma key="myp13password"')
                            idd=student_number
                            row=db.execute('select password from pass where id='+idd).fetchone()
                            pw=row[0]
                            db.close()
                            myfile.write(pw+"\n\n")
                            break
                            
                    except IOError as e:
                        self.log.error("Exception open file :" % e)
                        
                i=i+1
    except IOError as e:
        self.log.error("Exception open file :" % e)


os.system("rm identifiant.txt")
os.system("rm toutesdonnees.txt")

