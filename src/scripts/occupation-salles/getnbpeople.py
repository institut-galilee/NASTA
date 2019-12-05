#!/usr/bin/python3

import sys, getopt
import string 
import json
import re
from datetime import date,datetime
import string

"""
TODO get number of active connections using salleID which is the classroom's ID. Example: F205 
     Real-time --> (get the current time & date and format it then pass it as one argument 'date(2019,11,27,0,8,0) --> 27-11-2019 8:00)
"""

#def get_nb_active_connections(dict, salleID):
    

""" 
  this function formats current date and time to a string we can later on use to compare  
  to the date inside the dictionnary grapbed from the json file 
"""
def format_sysDate_JSONreadable(datec2check):
    JSON_readble_date = sysDate.strftime("Date(%d,%m,20%y,%H,%M,0)")
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

def json2dict(file):
  try:
    with open(file) as json_data:
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
  display_dictionnary_info(dictionnary)
