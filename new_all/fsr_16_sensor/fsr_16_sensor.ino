int fsrAnalogPin0 = 0; // FSR is connected to analog 0
int fsrAnalogPin1 = 1; // FSR is connected to analog 1
int fsrAnalogPin2 = 2; // FSR is connected to analog 0
int fsrAnalogPin3 = 3; // FSR is connected to analog 1
int fsrAnalogPin4 = 4; // FSR is connected to analog 0
int fsrAnalogPin5 = 5; // FSR is connected to analog 1
int fsrAnalogPin6 = 6; // FSR is connected to analog 0
int fsrAnalogPin7 = 7; // FSR is connected to analog 0
int fsrAnalogPin8 = 8; // FSR is connected to analog 0
int fsrAnalogPin9 = 9; // FSR is connected to analog 0
int fsrAnalogPin10 = 10; // FSR is connected to analog 1
int fsrAnalogPin11 = 11; // FSR is connected to analog 0
int fsrAnalogPin12 = 12; // FSR is connected to analog 1
int fsrAnalogPin13 = 13; // FSR is connected to analog 0
int fsrAnalogPin14 = 14; // FSR is connected to analog 1
int fsrAnalogPin15 = 15; // FSR is connected to analog 0



int LEDpin10 = 10;
int LEDpin11 = 11;     // connect Red LED to pin 11 (PWM pin)
int LEDpin12 = 12;
int LEDpin13 = 13;     // connect Red LED to pin 11 (PWM pin)
int LEDpin14 = 14;
int LEDpin15 = 15;     // connect Red LED to pin 11 (PWM pin)
int LEDpin16 = 16;
int LEDpin17 = 17;     // connect Red LED to pin 11 (PWM pin)
int LEDpin18 = 18;
int LEDpin19 = 19;     // connect Red LED to pin 11 (PWM pin)
int LEDpin20 = 20;
int LEDpin21 = 21;     // connect Red LED to pin 11 (PWM pin)
int LEDpin22 = 22;
int LEDpin23 = 23;     // connect Red LED to pin 11 (PWM pin)
int LEDpin24 = 24;
int LEDpin25 = 25;     // connect Red LED to pin 11 (PWM pin)

int fsrReading0;      // the analog reading from the FSR resistor divider
int fsrReading1; 
int fsrReading2;      // the analog reading from the FSR resistor divider
int fsrReading3; 
int fsrReading4;      // the analog reading from the FSR resistor divider
int fsrReading5; 
int fsrReading6;      // the analog reading from the FSR resistor divider
int fsrReading7; 
int fsrReading8;      // the analog reading from the FSR resistor divider
int fsrReading9; 
int fsrReading10;      // the analog reading from the FSR resistor divider
int fsrReading11; 
int fsrReading12;      // the analog reading from the FSR resistor divider
int fsrReading13; 
int fsrReading14;      // the analog reading from the FSR resistor divider
int fsrReading15; 

int LEDbrightness0;
int LEDbrightness1;
int LEDbrightness2;
int LEDbrightness3;
int LEDbrightness4;
int LEDbrightness5;
int LEDbrightness6;
int LEDbrightness7;
int LEDbrightness8;
int LEDbrightness9;
int LEDbrightness10;
int LEDbrightness11;
int LEDbrightness12;
int LEDbrightness13;
int LEDbrightness14;
int LEDbrightness15;
 
int mode = -1;
unsigned int sensorValue = 0; 

void setup(void)
{
  Serial.begin(9600);   // We'll send debugging information via the Serial monitor
  pinMode(LEDpin10, OUTPUT);
  pinMode(LEDpin11, OUTPUT);
  pinMode(LEDpin12, OUTPUT);
  pinMode(LEDpin13, OUTPUT);
  pinMode(LEDpin14, OUTPUT);
  pinMode(LEDpin15, OUTPUT);
  pinMode(LEDpin16, OUTPUT);
  pinMode(LEDpin17, OUTPUT);
  pinMode(LEDpin18, OUTPUT);
  pinMode(LEDpin19, OUTPUT);
  pinMode(LEDpin20, OUTPUT);
  pinMode(LEDpin21, OUTPUT);
  pinMode(LEDpin22, OUTPUT);
  pinMode(LEDpin23, OUTPUT);
  pinMode(LEDpin24, OUTPUT);
  pinMode(LEDpin25, OUTPUT);
 
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
      fsrReading0 = analogRead(fsrAnalogPin0);
      LEDbrightness0 = map(fsrReading0, 0, 1023, 0, 255);
      analogWrite(LEDpin10, LEDbrightness0);
      Serial.println(analogRead(fsrAnalogPin0));

      fsrReading1 = analogRead(fsrAnalogPin1);
      LEDbrightness1 = map(fsrReading1, 0, 1023, 0, 255);
      analogWrite(LEDpin11, LEDbrightness1);
      Serial.println(analogRead(fsrAnalogPin1));

      fsrReading2 = analogRead(fsrAnalogPin2);
      LEDbrightness2 = map(fsrReading2, 0, 1023, 0, 255);
      analogWrite(LEDpin12, LEDbrightness2);
      Serial.println(analogRead(fsrAnalogPin2));

      fsrReading3 = analogRead(fsrAnalogPin3);
      LEDbrightness3 = map(fsrReading3, 0, 1023, 0, 255);
      analogWrite(LEDpin13, LEDbrightness3);
      Serial.println(analogRead(fsrAnalogPin3));

      fsrReading4 = analogRead(fsrAnalogPin4);
      LEDbrightness4 = map(fsrReading4, 0, 1023, 0, 255);
      analogWrite(LEDpin14, LEDbrightness4);
      Serial.println(analogRead(fsrAnalogPin4));

      fsrReading5 = analogRead(fsrAnalogPin5);
      LEDbrightness5 = map(fsrReading5, 0, 1023, 0, 255);
      analogWrite(LEDpin15, LEDbrightness5);
      Serial.println(analogRead(fsrAnalogPin5));

      fsrReading6 = analogRead(fsrAnalogPin6);
      LEDbrightness6 = map(fsrReading6, 0, 1023, 0, 255);
      analogWrite(LEDpin16, LEDbrightness6);
      Serial.println(analogRead(fsrAnalogPin6));

      fsrReading7 = analogRead(fsrAnalogPin7);
      LEDbrightness7 = map(fsrReading7, 0, 1023, 0, 255);
      analogWrite(LEDpin17, LEDbrightness7);
      Serial.println(analogRead(fsrAnalogPin7));

      fsrReading8 = analogRead(fsrAnalogPin8);
      LEDbrightness7 = map(fsrReading8, 0, 1023, 0, 255);
      analogWrite(LEDpin18, LEDbrightness8);
      Serial.println(analogRead(fsrAnalogPin8));

      fsrReading9 = analogRead(fsrAnalogPin9);
      LEDbrightness9 = map(fsrReading9, 0, 1023, 0, 255);
      analogWrite(LEDpin18, LEDbrightness8);
      Serial.println(analogRead(fsrAnalogPin9));
      
      fsrReading10 = analogRead(fsrAnalogPin10);
      LEDbrightness10 = map(fsrReading10, 0, 1023, 0, 255);
      analogWrite(LEDpin20, LEDbrightness10);
      Serial.println(analogRead(fsrAnalogPin10));

      fsrReading11 = analogRead(fsrAnalogPin11);
      LEDbrightness11 = map(fsrReading11, 0, 1023, 0, 255);
      analogWrite(LEDpin21, LEDbrightness11);
      Serial.println(analogRead(fsrAnalogPin11));

      fsrReading12 = analogRead(fsrAnalogPin12);
      LEDbrightness4 = map(fsrReading12, 0, 1023, 0, 255);
      analogWrite(LEDpin22, LEDbrightness12);
      Serial.println(analogRead(fsrAnalogPin12));

      fsrReading13 = analogRead(fsrAnalogPin13);
      LEDbrightness13 = map(fsrReading13, 0, 1023, 0, 255);
      analogWrite(LEDpin23, LEDbrightness13);
      Serial.println(analogRead(fsrAnalogPin13));

      fsrReading14 = analogRead(fsrAnalogPin14);
      LEDbrightness14 = map(fsrReading14, 0, 1023, 0, 255);
      analogWrite(LEDpin24, LEDbrightness14);
      Serial.println(analogRead(fsrAnalogPin14));

      fsrReading15 = analogRead(fsrAnalogPin15);
      LEDbrightness15 = map(fsrReading15, 0, 1023, 0, 255);
      analogWrite(LEDpin25, LEDbrightness15);
      Serial.println(analogRead(fsrAnalogPin15));
    }
    // wait 100 milliseconds before the next loop for the analog-to-digital converter to settle after the last reading
    delay(100);
    
  }
}

