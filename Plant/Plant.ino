int PIN_PUMP = 4;
int PIN_PHOTORESISTOR = A0;
int PIN_MOISTURE = A1;

void setup() {
  Serial.begin(9600);
  pinMode(PIN_PUMP, OUTPUT);
}

void loop() {
  int light = map(analogRead(PIN_PHOTORESISTOR), 0, 1024, 0, 100);
  int moisture = analogRead(PIN_MOISTURE);
  
  Serial.print(light);
  Serial.print(",");
  Serial.println(moisture);
  
  delay(250);
}
