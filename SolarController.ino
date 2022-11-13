#include <Servo.h>

Servo myservo;

int angles[] =  {86,77,70,65,62,63,66,73,81};

void setup() {
  // put your setup code here, to run once:
myservo.attach(9);
Serial.begin(9600);
}

void loop() 
{
  // put your main code here, to run repeatedly:

  //Serial.print("Begin");
  int limit = sizeof(angles)/sizeof(angles[0]);
  delay(1000);
  for (int i = 0; i <= limit; i++)
  {
    myservo.write(angles[i]);
    delay(2000);
  }

  
  


}
