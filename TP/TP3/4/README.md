In part 4, wee use I2C to transmit information of the  potentiometer to ESP32 using arduino, MPU 6050 and BME280.

I used a led to see the result of the action on the potentiometer even if wee could see it on the monitor series.

The brightness of the led showed the level of the potentiometer.

How it's working?

I2C is a serial protocol for two-wire interface to connect low-speed devices.
On is serial data, the other is serial clock.

The information is received by the arduino and sent it to the esp 32.

The esp 32 read data on :
- BME 280 
- Arduino 
- MPU 6050 

And write it to the serial.


![board](https://github.com/institut-galilee/NASTA/blob/master/TP/TP3/4/part4-2.jpeg)


![board2](https://github.com/institut-galilee/NASTA/blob/master/TP/TP3/4/part4-1.jpeg)
