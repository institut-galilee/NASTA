In part 4, we used I2C to transmit information from the potentiometer to ESP32 using arduino, MPU 6050 and BME280.

We used a led to see the change of amplitude when playing around with the potentiometer. That being said, we can also see it on the monitor series.

The led's brightness shows the potentiometer's amplitude.

How does it work ?

I2C is a serial protocol for two-wire interface to connect low-speed devices.
For this particular example we used two ports, the serial data port and the serial clock port.

The information is received by the arduino and sent to the ESP32.

The ESP32 reads data on:
- BME 280 
- Arduino 
- MPU 6050 

And writes it to the serial.


![board](https://github.com/institut-galilee/NASTA/blob/master/TP/TP3/4/part4-2.jpeg)


![board2](https://github.com/institut-galilee/NASTA/blob/master/TP/TP3/4/part4-1.jpeg)
