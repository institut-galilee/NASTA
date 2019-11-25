
const int sensor_pin = A0; 
int sensor_value = 0; 


void setup() {
  Serial.begin(9600); 

void loop() {
  
  sensor_value = analogRead(sensor_pin); 
  Serial.println(sensor_value); 
  delay(100);

}