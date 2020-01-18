
from datetime import datetime,timedelta
from getcal import getc
from getweek import getAllSemaine
import csv
import os.path,time

def week_full():
        getc('./Doc/Edt_L3_Informatique.ics')
        getAllSemaine()
        if os.path.isfile('./Doc/Edt_L3_Informatique.ics'):
                if os.path.isfile('./Doc/trier.csv'):
                    if os.path.isfile('./Doc/week.txt'):
                        filenameweek='./Doc/week.txt'
                        filenamecsv='./Doc/trier.csv'
                        try:
                            with open(filenameweek,'r') as f_week:
                                i=0  
                                try:
                                    week=csv.reader(f_week) 
                                    for row2 in week:   
                                        with open(filenamecsv,'r') as f_csv:
                                            reader=csv.DictReader(f_csv)
                                            i=i+1
                                            try:
                                                filenameSemaine="./Doc/Semaines/semaine_"+str(i)
                                                with open(filenameSemaine+".csv", 'w') as myfile:
                                                    field=['Summary', 'UID', 'Description', 'Location', 'Start Time', 'End Time', 'URL']
                                                    writer = csv.DictWriter(myfile,fieldnames=field)
                                                    writer.writeheader()
                                                    writer = csv.writer(myfile, quoting=csv.QUOTE_ALL)                                                           
                                                    for row in reader:
                                                        semaineActuel_f = datetime.strptime(row2[0], "%Y-%m-%d")
                                                        chaine = row['Start Time'].split()
                                                        semainePrecedente_f=semaineActuel_f + timedelta(days=-7)                                        
                                                        semaineActuel_csv = datetime.strptime(chaine[0], "%Y-%m-%d")

                                                        if (semaineActuel_f >= semaineActuel_csv) and (semaineActuel_csv> semainePrecedente_f ):
                                                                    writer.writerow(row.values())
                                                                    writer.writerow("\n\n")                                                              
                                            except IOError:
                                                        print("Could not open file! Please close Excel!")
                                                        exit(0)

                                except IOError:
                                    print("Could not open file! file : "+filenamecsv)
                                    exit(0)
                        except IOError:
                            print("Could not open file!file : "+filenameweek)
                            exit(0)

week_full()
