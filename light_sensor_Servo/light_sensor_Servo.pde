/*
 * A simple programme that will change the intensity of
 * an LED based  * on the amount of light incident on 
 * the photo resistor.
 * 
 */

//PhotoResistor Pin
int lightPin = 1; //the analog pin the photoresistor is 
                  //connected to
                  //the photoresistor is not calibrated to any units so
                  //this is simply a raw sensor value (relative light)
//LED Pin
int ledPin = 7;   //the pin the LED is connected to
                 //we are controlling brightness so 
                  //we use one of the PWM (pulse width
                  // modulation pins)

#include <Servo.h>                  
Servo myservo;  // create servo object to control a servo 

int potpin = 0;  // analog pin used to connect the potentiometer
int val;    // variable to read the value from the analog pin 



void setup()
{
  pinMode(ledPin, OUTPUT); //sets the led pin to output

 /*
 * loop() - this function will start after setup 
 * finishes and then repeat
 */
 
  Serial.begin(9600);
  myservo.attach(9);  // attaches the servo on pin 9 to the servo object 
 
}
 
 
 
void loop()
{
 int lightLevel = analogRead(lightPin); //Read the
                                        // lightlevel
 lightLevel = map(lightLevel, 0, 900, 0, 255); 
         //adjust the value 0 to 900 to
         //span 0 to 255



 lightLevel = constrain(lightLevel, 0, 255);//make sure the 
                                           //value is betwween 
                                           //0 and 255
 analogWrite(ledPin, lightLevel);  //write the value
 
 
 val = analogRead(potpin);            // reads the value of the potentiometer (value between 0 and 1023) 
  Serial.println(val);  
  val = map(val, 0, 1023, 0, 179);     // scale it to use it with the servo (value between 0 and 180) 
  myservo.write(val);  

  // sets the servo position according to the scaled value 
  delay(15);                           // waits for the servo to get there 
}
