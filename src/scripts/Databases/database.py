import sys
import os.path
import pathlib
from icalendar import Calendar
import requests, urllib.request
import sqlite3
from datetime import datetime

filename = './doc/Edt_L3_Informatique.ics'
file_extension = str(filename)[-3:]
headers = ('Summary', 'UID', 'Description', 'Location', 'Start Time', 'End Time', 'URL')

class CalendarEvent:
    """Calendar event class"""
    summary = ''
    uid = ''
    description = ''
    location = ''
    start = ''
    end = ''
    url = ''

def telecharger():
    print("Téléchargement en cours...")
    url ='https://hyperplanning.univ-paris13.fr/hp2019/Telechargements/ical/Edt_L3_Informatique.ics?version=2018.0.3.6&idICal=83A8B2924D228D6B2ACC9D86B9C37194&param=643d5b312e2e36325d2666683d3126663d3131303030'
    requests.get(url,stream =True)
    a= pathlib.PurePath(".")
    a = str(a)
    addr=os.path.abspath(a)
    #Creat the doc dir
    if not os.path.isdir(addr+"/Doc"):
       os.mkdir("./Doc")
    urllib.request.urlretrieve(url,'./Doc/Edt_L3_Informatique.ics')
    print('Terminé.')



def __init__(self, name):
        self.name = name

events = []

def open_cal():
    if os.path.isfile(filename):
        if file_extension == 'ics':
            print("Extracting events from file:", filename, "\n")
            f = open(filename, 'rb')
            gcal = Calendar.from_ical(f.read())

            for component in gcal.walk():
                event = CalendarEvent()
                if component.get('SUMMARY') == None: continue #skip blank items
                event.summary = component.get('SUMMARY')
                event.uid = component.get('UID')
                event.description = component.get('DESCRIPTION')
                event.location = component.get('LOCATION')
                if hasattr(component.get('dtstart'), 'dt'):
                    event.start = component.get('dtstart').dt
                if hasattr(component.get('dtend'), 'dt'):
                    event.end = component.get('dtend').dt


                event.url = component.get('URL')
                events.append(event)
            f.close()
        else:
            print("You entered ", filename, ". ")
            print(file_extension.upper(), " is not a valid file format. Looking for an ICS file.")
            exit(0)
    else:
        print("I can't find the file ", filename, ".")
        print("Please enter an ics file located in the same folder as this script.")
        exit(0)




def db_write():
    telecharger()
    open_cal()
    dbfile="myp13database.db"
    try:
        connexion = sqlite3.connect(dbfile)
        curseur = connexion.cursor()
        curseur.execute('''CREATE TABLE IF NOT EXISTS hyperplanning(
        id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
        summary TEXT,
        description TEXT,
        location TEXT,
        startdate DATE,
        starthour TEXT,
        enddate DATE,
        endhour TEXT
        )''')
        for event in events:
                    ojd=datetime.now()
                    ojd_t=type(ojd)
                    if(isinstance(event.start,ojd_t) and isinstance(event.end,ojd_t)):
                        startdate=event.start.date()
                        starthour=str(event.start.time())
                        enddate=event.end.date()
                        endhour=str(event.end.time())

                        values = (event.summary,event.description, event.location, startdate, starthour, enddate, endhour)
                        curseur.execute('''INSERT INTO hyperplanning (summary,description,location,startdate,starthour,enddate,endhour) VALUES (?, ?, ?, ?, ?, ?, ?)''', values)
                        connexion.commit()
                    else:
                        values = (event.summary,event.description, event.location, event.start,event.end)
                        curseur.execute('''INSERT INTO hyperplanning (summary,description,location,startdate,enddate) VALUES (?, ?, ?, ?, ?)''', values)
                        connexion.commit()
        print("Database crée.")
        connexion.close()           
    except sqlite3.Error as e:
            self.log.error("Database error: %s" % e)
    except Exception as e:
            self.log.error("Exception in _query: %s" % e)



db_write()
