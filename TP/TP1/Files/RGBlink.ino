const int PIN_LED_R = 9;
const int PIN_LED_G = 10;
const int PIN_LED_B = 11;

void setup() {
  pinMode(PIN_LED_R, OUTPUT);
  pinMode(PIN_LED_G, OUTPUT);
  pinMode(PIN_LED_B, OUTPUT);
  displayColor(0, 0, 0);
}

void loop() {
  displayColor(0, 0, 255);
  delay(800);
  displayColor(255, 0, 0);
  delay(800);
  displayColor(0, 255, 0);
  delay(800);
  displayColor(255, 0, 255);
  delay(800);
  displayColor(255, 255, 255);
  delay(800);
  displayColor(0, 255, 255);
  delay(800);
  displayColor(255, 255, 0);
  delay(800);
}

void displayColor(int r, int g, int b) {
  analogWrite(PIN_LED_R, r);
  analogWrite(PIN_LED_G, g);
  analogWrite(PIN_LED_B, b);
}