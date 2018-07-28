// These constants won't change/ They're used to give names
// to the pins used:
const int analogInPinA0 = A0;
const int analogInPinA1 = A1;
const int analogInPinA2 = A2;

//initialize variables
int mode = -1;
unsigned int sensorValue = 0;

void setup() {
  //initalize serial communication at 9600 bps;
  Serial.begin(9600);
  // check serial communication - acknowledgment routine
  Serial.println('a'); // sending a character to PC
  char a = 'b';
while (a != 'a')
  {
    // Wait for a specific character from the PC
    a = Serial.read();
  }
 }

void loop() {
  if (Serial.available() > 0) // check is any data has been sent by the PC
  {
    mode = Serial.read(); // check if there is a request for accelerometer values
    if (mode == 'R') // used to set different modes for various operations. R is used to read accelerometer values
    {
      // read analog values of pin A0(x), A1(y), A2(z) and send them to the PC
      sensorValue = analogRead(analogInPinA0);
      Serial.println(sensorValue);
      sensorValue = analogRead(analogInPinA1);
      Serial.println(sensorValue);
      sensorValue = analogRead(analogInPinA2);
      Serial.println(sensorValue);
    }
    // wait 20 milliseconds before the next loop for the analog-to-digital converter to settle after the last reading
    delay(20);
  }

}
