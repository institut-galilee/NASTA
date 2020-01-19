#!/usr/bin/python3

import sys, getopt
import urllib.request
from urllib.error import URLError, HTTPError

# Usage example : python3 occupation.py -g quart -d "2019-12-04" -f "2019-12-04" -r reqId:1 -v -o data.json 

"""
   Cleans the response and then writes it to the json file provided as an argument (also has verbose mode with the "-v" option)
"""
def jsonresponse2file(file, response):
   
   try:   
      with open(file, 'w') as out_file:
            data_to_string = str(response.read())
            json_output = clean_request_data(data_to_string)
            print('[+] Cleaned request to convert it to json format')
            out_file.write(json_output )
            print('[+] Successfully written data to '+ file + '\n')
            if verbose == 1 : 
               print('[+] Generated your request in json format\n')
               #print(json_output+'\n')
   except IOError as e:
         print("Error: ", e, "Check permissions !")   

"""
   Dumps info to the user about the GET request he's sending
"""
def dumpConsoleInfo(base_url, final_url):
   print('\n')
   print('[+] GET request sent to ' + base_url + ' with the passed arguments ...')
   print('[+] Target Url is : ', final_url)
   
"""
   Constructs the URL the user requested
"""
def construct_final_url(base_url,grain,debut,fin,reqID):
   final_url =  base_url + 'grain=' + grain + '&debut=' + debut + '&fin=' + fin + '&tqx=' + reqID
   return final_url

"""
   Strip unwanted content from data grabbed from the server's response, to make it JSON-readable
"""
def clean_request_data(data):
   data_to_delete = "bgoogle.visualization.Query.setResponse("
   len_ = len(data_to_delete)
   json_output = data[len_ + 1:-3]
   return json_output
 


if __name__ == "__main__":
   
   verbose = 0
   base_url = "https://si-galilee.univ-paris13.fr/salles/occupation_data?"
  
   try:
      opts, args = getopt.getopt(sys.argv[1:],"g:d:f:r:o:hv", ['grain=','debut=','fin=','requestID=','outputfile=','verbose'])
   except getopt.GetoptError:
      print ('python3 occupation.py -g <grain> -d <date-debut> -f <date-fin> -r <reqID> -o <outputfile>') 
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print ('Usage : python3 occupation.py -g <grain> -d <date-debut> -f <date-fin> -r <reqID> -o <outputfile> ')
         sys.exit()
      elif opt in ("-g", "--grain"):
         grain = arg 
      elif opt in ("-d", "--debut"):
         debut = arg
      elif opt in ("-f", "--fin"):
         fin = arg 
      elif opt in ("-r", "--requestID"):
         reqID = arg
      elif opt in ("-o", "--outputfile"):
         outfile = arg
      elif opt in ("-v", "--verbose"):
         verbose = 1

   final_url = construct_final_url(base_url,grain,debut,fin,reqID)
   dumpConsoleInfo(base_url, final_url)

   try:
      response = urllib.request.urlopen(final_url)
   except HTTPError as e:
      print('[-] Error code : ', e.code,' ')
   except URLError as e:
      print('[-] Reason : ', e.reason)
   else:
      print('[+] Server is UP and responded to your request')      
      jsonresponse2file(outfile, response)