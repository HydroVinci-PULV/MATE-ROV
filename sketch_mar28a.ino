#include <Arduino.h>
#include <Wire.h>
#include <Adafruit_PWMServoDriver.h>

const int Pin0 = A0;
const int Pin1 = A1;
const int Pin2 = A2;
const int Pin3 = A3;
const int Pin6 = A6; //Arduino nano pin A4 et A5 pris (SCL et SDA en I2C)
const int Pin7 = A7;
const int pwmMin = 204;//120;
const int pwmMax = 1024; //630;
const int analogMin = 0;
const int analogMax = 1023; 


Adafruit_PWMServoDriver pwm;

void setup() {
  pinMode(Pin0, INPUT);
  pinMode(Pin1, INPUT);
  pinMode(Pin2, INPUT);
  pinMode(Pin3, INPUT);
  pinMode(Pin6, INPUT);
  pinMode(Pin7, INPUT);
  pwm.begin();
  pwm.setPWMFreq(100);
  Serial.begin(9600);
}

void loop() {

  static int previousVal0 = 0;
  static int previousVal1 = 0;
  static int previousVal2 = 0;
  static int previousVal3 = 0;
  static int previousVal4 = 0;

  int val0 = analogRead(Pin0);
  int val1 = analogRead(Pin1);
  int val2 = analogRead(Pin2);
  int val3 = analogRead(Pin3);
  int val4 = analogRead(Pin6);

  Serial.print("A0 ");
  Serial.print(val0);
  Serial.print(" ");

  Serial.print("P0: ");
  int pwmval0 = map((val0 + previousVal0) / 2, analogMin, analogMax, pwmMin, pwmMax);  
  Serial.print(pwmval0);
  pwm.setPWM(0, 0, pwmval0);
  delay(5);
  previousVal0 = val0;

  Serial.println();
  

  
  Serial.print("A1 ");
  Serial.print(val1);
  Serial.print(" ");

  Serial.print("P1: ");
  int pwmval1 = map((val1 + previousVal1) / 2, analogMin, analogMax, pwmMin, pwmMax);  
  Serial.print(pwmval1);
  pwm.setPWM(1, 0, pwmval1);
  delay(5);
  previousVal1 = val1;

  Serial.println();



  Serial.print("A2 ");
  Serial.print(val2);
  Serial.print(" ");

  Serial.print("P2: ");
  int pwmval2 = map((val2 + previousVal2) / 2, analogMin, analogMax, pwmMin, pwmMax);  
  Serial.print(pwmval2);
  pwm.setPWM(2, 0, pwmval2);
  delay(5);
  previousVal2 = val2;

  Serial.println();



  Serial.print("A3 ");
  Serial.print(val3);
  Serial.print(" ");

  Serial.print("P3: ");
  int pwmval3 = map((val3 + previousVal3) / 2, analogMin, analogMax, pwmMin, pwmMax);  
  Serial.print(pwmval3);
  pwm.setPWM(3, 0, pwmval3);
  delay(5);
  previousVal3 = val3;

  Serial.println();



  Serial.print("A4 ");
  Serial.print(val4);
  Serial.print(" ");

  Serial.print("P4: ");
  int pwmval4 = map((val4 + previousVal4) / 2, analogMin, analogMax, pwmMin, pwmMax);  
  Serial.print(pwmval4);
  pwm.setPWM(4, 0, pwmval4);
  delay(5);
  previousVal4 = val4;

  Serial.println();

  delay(10);
  
}