


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
  // put your main code here, to run repeatedly:

}
