#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_LSM303_U.h>

/* Assign a unique ID to this sensor at the same time */
Adafruit_LSM303_Accel_Unified accel = Adafruit_LSM303_Accel_Unified(54321);

int mode = -1;
unsigned int sensorValue = 0; 

void setup(void)
{
  //initalize serial communication at 9600 bps;
  Serial.begin(9600);
  /* Initialise the sensor */
  if(!accel.begin())
  {
    /* There was a problem detecting the ADXL345 ... check your connections */
    Serial.println("Ooops, no LSM303 detected ... Check your wiring!");
    while(1);
  }
 
  // check serial communication - acknowledgment routine
  Serial.println('a'); // sending a character to PC
  char a = 'b';
while (a != 'a')
  {
    // Wait for a specific character from the PC
    a = Serial.read();
  }

  /* Display some basic information on this sensor */
}

void loop(void)
{
  /* Get a new sensor event */
  sensors_event_t event;
  accel.getEvent(&event);
  
  if (Serial.available() > 0) // check is any data has been sent by the PC
  {
    mode = Serial.read(); // check if there is a request for accelerometer values
    if (mode == 'R') // used to set different modes for various operations. R is used to read accelerometer values
    {
      // read analog values of pin A0(x), A1(y), A2(z) and send them to the PC
      sensorValue = event.acceleration.x;
      Serial.println(sensorValue);
      sensorValue = event.acceleration.y;
      Serial.println(sensorValue);
      sensorValue = event.acceleration.z;
      Serial.println(sensorValue);
    }
    // wait 20 milliseconds before the next loop for the analog-to-digital converter to settle after the last reading
    delay(20);
  }
}

