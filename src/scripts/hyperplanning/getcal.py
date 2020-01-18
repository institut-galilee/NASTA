import sys
import os.path
import pathlib
from icalendar import Calendar
import csv , requests, urllib.request
import pandas


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
    #r=requests.get(url,stream =True)
    a= pathlib.PurePath(".")
    a = str(a)
    addr=os.path.abspath(a)
    #Creat the doc dir
    if not os.path.isdir(addr+"/Doc"):
        os.mkdir("./Doc")
    urllib.request.urlretrieve(url,'./Doc/Edt_L3_Informatique.ics')
    print('Terminé.')
    #Creat the Semaines dir.
    mon_path= pathlib.PurePath(".")
    mon_path = str(mon_path)
    mon_path=os.path.abspath(mon_path)
    if not os.path.isdir(mon_path+"/Doc/Semaines"):
        os.mkdir("./Doc/Semaines")


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


def csv_write(icsfile):
    csvfile = icsfile[:-3] + "csv"
    try:
        with open(csvfile, 'w') as myfile:
            wr = csv.writer(myfile, quoting=csv.QUOTE_ALL)
            wr.writerow(headers)
            for event in events:
                values = (event.summary, event.uid, event.description, event.location, event.start, event.end, event.url)
                wr.writerow(values)
            print("Wrote to ", csvfile, "\n")
    except IOError:
        print("Could not open file! Please close Excel!")
        exit(0)
    try:
        with open(csvfile, 'r') as myfile:
            df = pandas.read_csv(csvfile, index_col='Summary')
            df = df.sort_values(by=['Start Time'], ascending=True)  #ascending order of CSV with panda
            df.to_csv('./doc/trier.csv')
    except IOError:
        print("Could not open file! Please close Excel!")
        exit(0)
       

#debug_event(event)
def debug_event(class_name):
    print("Contents of ", class_name.name, ":")
    print(class_name.summary)
    print(class_name.uid)
    print(class_name.description)
    print(class_name.location)
    print(class_name.start)
    print(class_name.end)
    print(class_name.url, "\n")


#launcher of function.
def  getc(filename):
    telecharger()
    open_cal()
    csv_write(filename)
