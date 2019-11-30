This is the part 2 of the tp 3.
We connect our arduino to ESP32 using I2C.
Code for ESP32 for being in Master mode :

      #include <Wire.h>
      // Include the required Wire library for I2C<br>#include 
      int x = 0;
      void setup() {
        // Start the I2C Bus as Master
        Wire.begin(); 
      }
      void loop() {
        Wire.beginTransmission(9); // transmit to device #9
        Wire.write(x);              // sends x 
        Wire.endTransmission();    // stop transmitting
        x++; // Increment x
        if (x > 5) x = 0; // reset x once it gets 6
        delay(500);
      }
      

Code for Slave, here the arduino :

      #include <Wire.h>

      // Include the required Wire library for I2C<br>#include <Wire.h>
      int LED = LED_BUILTIN;
      int x = 0;
      void setup() {
        // Define the LED pin as Output
        Serial.begin(9600);
        pinMode (LED, OUTPUT);
        // Start the I2C Bus as Slave on address 9
        Wire.begin(9);
        Serial.println("Ok"); 

        // Attach a function to trigger when something is received.
        Wire.onReceive(receiveEvent);
      }
      void receiveEvent(int bytes) {
        x = Wire.read();    // read one character from the I2C
        Serial.println(x); 
      }
      void loop() {
        //If value received is 0 blink LED for 200 ms
        if (x == 0) {
          digitalWrite(LED, HIGH);
          delay(200);
          digitalWrite(LED, LOW);
          delay(200);
        }
        //If value received is 3 blink LED for 400 ms
        if (x == 3) {
          digitalWrite(LED, HIGH);
          delay(400);
          digitalWrite(LED, LOW);
          delay(400);
        }
      }
      
![ARDUINOESP32](https://github.com/institut-galilee/NASTA/blob/master/TP/TP3/2/WhatsApp%20Image%202019-11-30%20at%2018.49.17.jpeg)
  

