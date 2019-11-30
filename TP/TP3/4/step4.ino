int potPin = 0;     
int ledPin = 11; 
 
int potValue = 0;
int ledValue = 0; 
void setup() { 
 
Serial.begin(9600); 
 
pinMode (potPin , INPUT); pinMode (ledPin , OUTPUT); 
 
}
void loop() { 
 
potValue=analogRead(potPin); 
 
 
ledValue=map(potValue, 0, 1023, 0, 255); 
 
 
analogWrite(ledPin, ledValue); 
analogWrite(4, potValue); 
 
Serial.print("Valeur du potentiomètre = "); 
Serial.println(potValue); 
 
Serial.print("Valeur de la led = "); 
Serial.println(ledValue); 
 
Serial.print ("\n"); 
 
delay(100); 
 
} 
