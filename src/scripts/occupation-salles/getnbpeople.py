#!/usr/bin/python3

import sys, getopt,os
import string 
import json
import re
from datetime import date,datetime
import string
import sqlite3

"""
TODO get number of active connections using salleID which is the classroom's ID. Example: F205 
     Real-time --> (get the current time & date and format it then pass it as one argument 'date(2019,11,27,0,8,0) --> 27-11-2019 8:00)
"""

#def get_nb_active_connections(dict, salleID):
    

""" 
  this function formats current date and time to a string we can later on use to compare  
  to the date inside the dictionnary grapbed from the json file 
"""
def format_sysDate_JSONreadable():
    JSON_readble_date = datetime.now().strftime("Date(%d,%m,20%y,%H,%M,0)")
    return JSON_readble_date


"""
  This function displays some information about the dictionnary converted from json and containg classroom occupation info
"""
def display_dictionnary_info(dic):

    print('[+] Dictionnary keys are : ')
    print(dic['table'].keys())
    print('\n')
    print('[+] Columns are (correspond to classrooms) : \n')
    print(dic['table']['cols'])
    print('\n')
    print('[+] Rows are (correspond to number of active (or total) connections in classroom): \n')
    print(dic['table']['rows'])


def recupesalleinfo(dictionnary):
    try:
        #connection to the database
        #create if it doesn't exist
        if (os.path.isfile("occupation.db")):
            os.system("rm occupation.db")
        connexion = sqlite3.connect("occupation.db") 
        curseur = connexion.cursor()
        #Request for CREATE TABLE 'salleinfo'
        curseur.execute('''CREATE TABLE IF NOT EXISTS salleinfo(
        salle TEXT default (NULL),
        occupation TEXT default (NULL)

        )''')
        
        #Type: list
        #Description: Names of our columns in the table, we will use it on the request.
        liste_id=['dates','total','F200','F201','F202','F203','F204','F205','F206','F207','G207','G208','G209','G210','G211','G212','G215']

        #Type: list
        #Description: used toextract values from dictionnary.
        values=[]
        i=0
        for row in dictionnary['table']['rows']:          
            for row2 in row.values():
              j=0
              #Type: tuple
              #Description: this tuple contains all the values that we will need for the request.
              placeholders=()    
              columns = ', '.join(liste_id) #create columns list for the request.
              values.append(row2)
              liste_value=values[i] #the value is a dict so we have a dict of dict [dictionnary of dictionnary].
              for cmpt in liste_value:
                listedict=liste_value[j] #extract the last dictionary, so we only have a dictionary list.
                valeurdict=(str(listedict['v'])) #here we extract the values contained in the dictionary.            
                placeholders = placeholders +(valeurdict,) #insert the values in the tuple for the request.
                j=j+1

              i=i+1    
        print("[+] Database created.")
        i=0
        requete_columns = ("salle", "occupation")
        for room in liste_id:
          query = """INSERT INTO salleinfo %s VALUES ('%s', '%s');""" % (requete_columns, room, placeholders[i])
          if(i>1):
            
            curseur.execute(query)
            connexion.commit()
          i=i+1
        connexion.close()
    except sqlite3.Error as e:
            self.log.error("Database error: %s" % e)
    except Exception as e:
            self.log.error("Exception in _query: %s" % e)

""" 
Function that converts json data to dictionnary type
"""
def json2dict():
  try:
    today = str(date.today())
    os.system("python3 occupation.py -g quart -d "+today +" -f "+today+" -r reqId:1 -v -o data.json ")
    with open("data.json") as json_data:
      
      d = json.load(json_data)
      print('[+] JSON data has been successfully converted to python dictionnary type !')          
      return d
  except IOError as e: 
    print("Error: ",e)

#keys = {"cols","rows"}
#dict_new = {x:d[x] for x in d['table']}
#print(dict_new)

if __name__ == "__main__":
  
  print('[*] Script that returns the number of connections (people) per classroom at execution time  ')
  print('[*] Loads the occupation json data and processes it (object-dictionnary conversion)')
  try:
      opts, args = getopt.getopt(sys.argv[1:],"s:h", ['help']) # Note that argument s indicates which classroom you wants to target
  except getopt.GetoptError:
      print ('\nUsage : python3 getnbpeople.py -s <classroomID>') 
      sys.exit(2)
  for opt, arg in opts:
    if opt in ("-h","--help"):
      print ('Usage : python3 getnbpeople.py -s <classroomID>')
      sys.exit()

  dictionnary = json2dict()
 # display_dictionnary_info(dictionnary)
  recupesalleinfo(dictionnary)
  

