#!/usr/bin/python3

# -*- coding: utf8 -*-

import RPi.GPIO as GPIO
import MFRC522
import signal
import sys
import time
continue_reading = True

# Capture SIGINT for cleanup when the script is aborted
def end_read(signal,frame):
    global continue_reading
    continue_reading = False
    GPIO.cleanup()

GPIO.setwarnings(False)
# Hook the SIGINT
signal.signal(signal.SIGINT, end_read)

# Create an object of the class MFRC522
MIFAREReader = MFRC522.MFRC522()

i=0
# This loop keeps checking for chips. If one is near it will get the UID and authenticate
while continue_reading:
    if(i!=15): 
        # Scan for cards    
        (status,TagType) = MIFAREReader.MFRC522_Request(MIFAREReader.PICC_REQIDL)

        
        # Get the UID of the card
        (status,uid) = MIFAREReader.MFRC522_Anticoll()

        # If we have the UID, continue
        if status == MIFAREReader.MI_OK:

            # Print UID
            print("{} {} {} {}".format(uid[0], uid[1], uid[2], uid[3]))
            continue_reading = False
            identifiant="{} {} {} {}".format(uid[0], uid[1], uid[2], uid[3])
            try:
                with open("identifiant.txt","w") as myfile:
                    myfile.write(identifiant)
            except IOError as e:
                self.log.error("Exception in file" % e)
            
        time.sleep(0.5)
        i=i+1
    else:
        try:
            with open("identifiant.txt","w") as myfile:
                myfile.write("Failed")
        except IOError as e:
            self.log.error("Timeout Exception" % e)
        break
