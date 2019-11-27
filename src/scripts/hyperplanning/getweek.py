import sys
import os
from pathlib import PurePosixPath
from datetime import date, timedelta,datetime

def getAllSemaine():
    semaine=0
    d0 = date(2019-1,12,22)
    aujourdhui=datetime.now()
    year=aujourdhui.year
    datecomparer=datetime(year,1,1)
    while aujourdhui > datecomparer: 
           semaine=semaine+1
           datecomparer+=timedelta(7)
    print(semaine)
    while d0.weekday():  
        d0 += timedelta(1)

    d =  d0 + timedelta(-1, weeks=semaine)

    try:

        with open('./Doc/week.txt', 'w') as myfile:
            
            for j in range(79-semaine+29):
                d += timedelta(7)
                myfile.write(d.strftime('%Y-%m-%d\n'))
            print("\nWrote to ", './Doc/week.txt', "\n")
    except IOError:
        print("Could not open file! Please close Excel!")
        exit(0)
