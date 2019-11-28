#!/usr/bin/python
import sys, getopt
import string 
import json

"""
TODO get number of active connections using salleID which is the classroom's ID. Example: F205 
     Real-time --> (get the current time & date and format it then pass it as one argument 'date(2019,11,27,0,8,0) --> 27-11-2019 8:00)
"""
  #def get_nb_active_connections(dict, salleID):

def main(file):
    try:
        with open(file) as json_data:
              d = json.load(json_data)
              print('[+] JSON data has been successfully converted to python dictionnary type !')          
              #print(d)
    except IOError as e: 
        print('Error: ', e)
    print('[+] Dictionnary keys are : ')
    print(d.keys())
    print('\n')
    print('[+] Columns are (correspond to classrooms) : \n')
    print(d['table']['cols'])
    print('\n')
    print('[+] Rows are (correspond to number of active (or total) connections in classroom): \n')
    print(d['table']['rows'])


if __name__ == "__main__":
  
  print('[*] Script that loads the occupation json data and processes it (object-dictionnary conversion)')
  try:
      opts, args = getopt.getopt(sys.argv[1:],"i:s:d:h", ['input=','help'])
  except getopt.GetoptError:
      print ('\nUsage : python3 jsondecode.py -i <inputfile>') 
      sys.exit(2)
  for opt, arg in opts:
    if opt in ("-h","--help"):
      print ('Usage : python3 jsondecode.py -i <jsonfile>')
      sys.exit()
    elif opt in ("-i", "--input"):
      file = arg 
  main(file)

