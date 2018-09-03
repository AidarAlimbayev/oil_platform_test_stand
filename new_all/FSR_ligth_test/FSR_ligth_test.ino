/* FSR testing sketch. 
 
Connect one end of FSR to 5V, the other end to Analog 0.
Then connect one end of a 10K resistor from Analog 0 to ground
Connect LED from pin 11 through a resistor to ground 
 
For more information see www.ladyada.net/learn/sensors/fsr.html */
 
int fsrAnalogPin0 = A0;
int fsrAnalogPin1 = A1;// FSR is connected to analog 0
int LEDpin1 = 11; 
int LEDpin2 = 10; // connect Red LED to pin 11 (PWM pin)
int fsrReading0;
int fsrReading1;// the analog reading from the FSR resistor divider
int LEDbrightness0;
int LEDbrightness1;
 
void setup(void) {
  Serial.begin(9600);   // We'll send debugging information via the Serial monitor
  pinMode(LEDpin1, OUTPUT);
  pinMode(LEDpin2, OUTPUT);
}
 
void loop(void) {
  fsrReading0 = analogRead(fsrAnalogPin0);
  Serial.print("Analog reading 0 = ");
  Serial.println(fsrReading0);
   
  // we'll need to change the range from the analog reading (0-1023) down to the range
  // used by analogWrite (0-255) with map!
  LEDbrightness0 = map(fsrReading0, 0, 1023, 0, 255);
  // LED gets brighter the harder you press
  analogWrite(LEDpin1, LEDbrightness0);

   fsrReading1 = analogRead(fsrAnalogPin1);
  Serial.print("Analog reading 1 = ");
  Serial.println(fsrReading1);

    // we'll need to change the range from the analog reading (0-1023) down to the range
  // used by analogWrite (0-255) with map!
  LEDbrightness1 = map(fsrReading1, 0, 1023, 0, 255);
  // LED gets brighter the harder you press
  analogWrite(LEDpin2, LEDbrightness1);
 
  delay(100);
}
