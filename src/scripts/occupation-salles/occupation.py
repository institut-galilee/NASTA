#!/usr/bin/python

import sys, getopt
import urllib.request
from urllib.error import URLError, HTTPError

def main():

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

   final_url = base_url + 'grain=' + grain + '&debut=' + debut + '&fin=' + fin + '&tqx=' + reqID
   
   print('\n')
   print('[+] GET request sent to ' + base_url + ' with the passed arguments ...')
   print('[+] Target Url is : ', final_url)
   
   try:
      response = urllib.request.urlopen(final_url)
   except HTTPError as e:
      print('[-] Error code: ', e.code,' ')
   except URLError as e:
      print('[-] Reason: ', e.reason)
   else:
      print('[+] Server is UP and responded to your request')      
      try:   
         with open(outfile, 'w') as out_file:
            data_to_string = str(response.read())
            data_to_delete = "bgoogle.visualization.Query.setResponse("
            len_ = len(data_to_delete)
            json_output = data_to_string[len_ + 1:-3]
            print('[+] Cleaned request to convert it to json format')
            out_file.write(json_output )
            print('[+] Successfully written data to '+ outfile + '\n')
            if verbose == 1 : 
               print('[+] Generated your request in json format\n')
               print(json_output+'\n')
      except IOError as e:
         print("Error: ", e, "Check permissions !")     


if __name__ == "__main__":
   main()
