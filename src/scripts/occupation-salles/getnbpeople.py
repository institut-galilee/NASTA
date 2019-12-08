#!/usr/bin/python3

import sys, getopt
import string 
import json
from datetime import date,datetime
import string
import sqlite3

"""
TODO get number of active connections using salleID which is the classroom's ID. Example: F205 
     Real-time --> (get the current time & date and format it then pass it as one argument 'date(2019,11,27,0,8,0) --> 27-11-2019 8:00)
"""

def get_nb_active_connections(dict, salleID):
    

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
        #connection to the database.
        #Creates if it doesn't exist
        connexion = sqlite3.connect("occupation_DataBase.db")
        curseur = connexion.cursor()
        #Request for CREATE TABLE 'salleinfo'
        
        curseur.execute('''CREATE TABLE IF NOT EXISTS salleinfo(
                           id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
                           dates TEXT default (NULL) UNIQUE,
                           total TEXT default (NULL),
                           F200 TEXT default (NULL),
                           F201 TEXT default (NULL),
                           F202 TEXT default (NULL),
                           F203 TEXT default (NULL),
                           F204 TEXT default (NULL),
                           F205 TEXT default (NULL),
                           F206 TEXT default (NULL),
                           F207 TEXT default (NULL),
                           G207 TEXT default (NULL),
                           G208 TEXT default (NULL),
                           G209 TEXT default (NULL),
                           G210 TEXT default (NULL),
                           G211 TEXT default (NULL),
                           G212 TEXT default (NULL),
                           G215 TEXT default (NULL))'''
                        )
        # Type: list
        # Description: Names of our columns in the table, we will use this list for the request.
        liste_id=['dates','total','F200','F201','F202','F203','F204','F205','F206','F207','G207','G208','G209','G210','G211','G212','G215']

        # Type: list
        # Description: use for extract value from dictionnary.
        values=[]
        i=0
        for row in dictionnary['table']['rows']:          
            for row2 in row.values():
              j=0
              # Type: tuple
              # Description: that tuple will contain all the values we'll need for the request.
              placeholders=()    
              columns = ', '.join(liste_id) #create columns list for the request.
              values.append(row2)
              liste_value=values[i] # the value is a dict, then it's a list of [dictionnary of dictionnary].
              for cmpt in liste_value:
                listedict=liste_value[j] # extract the last dictionnary, then is just a list of dictionnary.
                valeurdict=(str(listedict['v'])) # here extract the value from the dictionnary.            
                placeholders = placeholders +(valeurdict,) # insert the value in the tuple for the request.
                j=j+1
              query = 'INSERT INTO salleinfo (%s) VALUES %s;' % (columns,  placeholders)                
              curseur.execute(query)
              connexion.commit()
              i=i+1    
        print("[+] Successfully created and filled database ! ")
       
    except sqlite3.Error as e:
            self.log.error("Database error: %s" % e)
    except Exception as e:
            self.log.error("Exception in _query: %s" % e)


def json2dict(file):
  try:
    with open(file) as json_data:
      d = json.load(json_data)
      print('[+] JSON data has been successfully converted to python dictionnary type !')          
      return d
  except IOError as e: 
    print("Error: ",e)


if __name__ == "__main__":
  
  print('[*] Script that returns the number of connections (people) per classroom at execution time  ')
  print('[*] Loads the occupation json data and processes it (object-dictionnary conversion)')
  try:
      opts, args = getopt.getopt(sys.argv[1:],"i:s:h", ['input=','help']) # Note that argument s indicates which classroom you wants to target
  except getopt.GetoptError:
      print ('\nUsage : python3 getnbpeople.py -i <jsonfile> -s <classroomID>') 
      sys.exit(2)
  for opt, arg in opts:
    if opt in ("-h","--help"):
      print ('Usage : python3 getnbpeople.py -i <jsonfile> -s <classroomID>')
      sys.exit()
    elif opt in ("-i", "--input"):
      file = arg
  dictionnary = json2dict(file)
  #display_dictionnary_info(dictionnary)
  recupesalleinfo(dictionnary)
  

