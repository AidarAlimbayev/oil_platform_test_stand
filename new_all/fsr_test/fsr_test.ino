int fsrAnalogPin = 0; // FSR is connected to analog 0
int LEDpin = 11;      // connect Red LED to pin 11 (PWM pin)
int fsrReading;      // the analog reading from the FSR resistor divider
int LEDbrightness;
 
int mode = -1;
unsigned int sensorValue = 0; 

void setup(void)
{
  Serial.begin(9600);   // We'll send debugging information via the Serial monitor
  pinMode(LEDpin, OUTPUT);
 
  // check serial communication - acknowledgment routine
  Serial.println('a'); // sending a character to PC
  char a = 'b';
while (a != 'a')
  {
    // Wait for a specific character from the PC
    a = Serial.read();
  }
}

void loop(void)
{

  if (Serial.available() > 0) // check is any data has been sent by the PC
  {
    mode = Serial.read(); // check if there is a request for accelerometer values
    if (mode == 'R') // used to set different modes for various operations. R is used to read accelerometer values
    {
      fsrReading = analogRead(fsrAnalogPin);
      LEDbrightness = map(fsrReading, 0, 1023, 0, 255);
      analogWrite(LEDpin, LEDbrightness);
      Serial.println(LEDbrightness);
      
    }
    // wait 20 milliseconds before the next loop for the analog-to-digital converter to settle after the last reading
    delay(100);
    fsrReading = analogRead(fsrAnalogPin);
    LEDbrightness = map(fsrReading, 0, 1023, 0, 255);
    analogWrite(LEDpin, LEDbrightness);
  }
}

