#include <Arduino.h>
#include <Wire.h>
#include <Adafruit_PWMServoDriver.h>

// 0;1021;204;1024; 
// 156;955;254;939; 
// 973;137;274;929; 
// 0;1023;214;1024; 
// 646;374;204;1024;

const int Pin0 = A0;
const int Pin1 = A1;
const int Pin2 = A2;
const int Pin3 = A3;
const int Pin6 = A6;  //Arduino nano pin A4 et A5 pris (SCL et SDA en I2C)
const int pwmMin = 204;   //120;
const int pwmMax = 1024;  //630;
const int analogMin = 0;
const int analogMax = 1023;

const int analog0Min = 0;
const int analog0Max = 1021;
const int pwm0Min = 204;
const int pwm0Max = 1024;

const int analog1Min = 156;
const int analog1Max = 955;
const int pwm1Min = 254;
const int pwm1Max = 939;

const int analog2Min = 973;
const int analog2Max = 137;
const int pwm2Min = 274;
const int pwm2Max = 929;

const int analog3Min = 0;
const int analog3Max = 1023;
const int pwm3Min = 214;
const int pwm3Max = 1024;

const int analog4Min = 0;
const int analog4Max = 1023;
const int pwm4Min = 480;
const int pwm4Max = 725;


Adafruit_PWMServoDriver pwm;

void setup() {
  pinMode(Pin0, INPUT);
  pinMode(Pin1, INPUT);
  pinMode(Pin2, INPUT);
  pinMode(Pin3, INPUT);
  pinMode(Pin6, INPUT);
  pwm.begin();
  pwm.setPWMFreq(100);
  Serial.begin(9600);
}

void printDebug(int val0, int pwmval0) {

  Serial.print("A0 ");
  Serial.print(val0);
  Serial.print(" ");

  Serial.print("P0: ");
  Serial.print(pwmval0);
  Serial.println();
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


  //Serial.print("A0 ");
  //Serial.print(val0);
  //Serial.print(", ");

  //Serial.print("P0: ");
  int pwmval0 = map((val0 + previousVal0) / 2, analog0Min, analog0Max, pwm0Min, pwm0Max);
  pwmval0 = constrain(pwmval0, pwm0Min, pwm0Max);
  //Serial.print(pwmval1);
  pwm.setPWM(8, 0, pwmval0);
  delay(5);
  previousVal0 = val0;

  //Serial.println();

  printDebug(val0, pwmval0);


  //Serial.print("A1 ");
  //Serial.print(val1);
  //Serial.print(" ");

  //Serial.print("P1: ");
  int pwmval1 = map((val1 + previousVal1) / 2, analog1Min, analog1Max, pwm1Min, pwm1Max);
  pwmval1 = constrain(pwmval1, pwm1Min, pwm1Max);
  //Serial.print(pwmval1);
  pwm.setPWM(9, 0, pwmval1);
  delay(5);
  previousVal1 = val1;

  //Serial.println();



  //Serial.print("A2 ");
  //Serial.print(val2);
  //Serial.print(" ");

  //Serial.print("P2: ");
  int pwmval2 = map((val2 + previousVal2) / 2, analog2Min, analog2Max, pwm2Min, pwm2Max);
  pwmval2 = constrain(pwmval2, pwm2Min, pwm2Max);
  //Serial.print(pwmval2);
  pwm.setPWM(10, 0, pwmval2);
  delay(5);
  previousVal2 = val2;

  //Serial.println();



  //Serial.print("A3 ");
  //Serial.print(val3);
  //Serial.print(" ");

  //Serial.print("P3: ");
  int pwmval3 = map((val3 + previousVal3) / 2, analog3Min, analog3Max, pwm3Min, pwm3Max);
  pwmval3 = constrain(pwmval3, pwm3Min, pwm3Max);
  //Serial.print(pwmval3);
  pwm.setPWM(11, 0, pwmval3);
  delay(5);
  previousVal3 = val3;

  //Serial.println();



  //Serial.print("A4 ");
  //Serial.print(val4);
  //Serial.print(" ");

  //Serial.print("P4: ");

  int pwmval4 = map((val4 + previousVal4) / 2, analog4Min, analog4Max, pwm4Min, pwm4Max);
  pwmval4 = constrain(pwmval4, pwm4Min, pwm4Max);
  //Serial.print(pwmval4);
  pwm.setPWM(12, 0, pwmval4);
  delay(5);
  previousVal4 = val4;

  Serial.println();


  delay(10);
}