// initializing variables
int mode = 1;

// define where the pins are connected
int value;

 void setup()
 {
  // initialize serial communication at 9600 bps;
  Serial.begin(9600);
  //check serial communication - acknowledgment routine
  Serial.println('a');
  char a = 'b';
  while (a != 'a')
  {
    // Wait for a specific character from the PC
    a = Serial.read();
  }
 }

void loop()
{
  if (Serial.available() > 0) // check is any data has been sent by the PC
  {
    mode = Serial.read();
    switch(mode) // used to set different modes for various operations, F is used to read sensor values
    {
      case 'F': //Forse sensor
      value = analogRead(A0); // Sensor connected to A0
      Serial.println(value);  // Send value over Serial
      break;
    }
  }
}

