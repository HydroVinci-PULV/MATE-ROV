#include <Arduino.h>
#include <Wire.h>
#include <Adafruit_PWMServoDriver.h>

// 0;1023;102;512; 
// 880;209;167;439; 
// 914;174;217;484; 
// 0;1023;102;512; 
// 0;1023;240;362; 

const int Pin0 = A0;
const int Pin1 = A1;
const int Pin2 = A2;
const int Pin3 = A3;
const int Pin6 = A6;
const int pwmMin = 102; // (0.5ms / (1000ms / 50hz / 4096 samples))
const int pwmMax = 512; // (2.5ms / (1000ms / 50hz / 4096 samples))
const int analogMin = 0;
const int analogMax = 1023;

const int analog0Min = 0;
const int analog0Max = 1023;
const int pwm0Min = 102;
const int pwm0Max = 512;

const int analog1Min = 880;
const int analog1Max = 209;
const int pwm1Min = 167;
const int pwm1Max = 439;

const int analog2Min = 914;
const int analog2Max = 174;
const int pwm2Min = 217;
const int pwm2Max = 484;

const int analog3Min = 0;
const int analog3Max = 1023;
const int pwm3Min = 102;
const int pwm3Max = 512;

const int analog4Min = 0;
const int analog4Max = 1023;
const int pwm4Min = 240;
const int pwm4Max = 362;

Adafruit_PWMServoDriver pwm;

void setup() {
  pinMode(Pin0, INPUT);
  pinMode(Pin1, INPUT);
  pinMode(Pin2, INPUT);
  pinMode(Pin3, INPUT);
  pinMode(Pin6, INPUT);
  Serial.begin(9600);
}

void loop() {

  if (Serial.available() > 0){
    delay(50);
    while (Serial.available() > 0) Serial.read();

    int val0 = analogRead(Pin0);
    int val1 = analogRead(Pin1);
    int val2 = analogRead(Pin2);
    int val3 = analogRead(Pin3);
    int val4 = analogRead(Pin6);

    int pwmval0 = map(val0, analog0Min, analog0Max, pwm0Min, pwm0Max);
    pwmval0 = constrain(pwmval0, pwm0Min, pwm0Max);
  

    int pwmval1 = map(val1, analog1Min, analog1Max, pwm1Min, pwm1Max);
    pwmval1 = constrain(pwmval1, pwm1Min, pwm1Max);
    

    int pwmval2 = map(val2, analog2Min, analog2Max, pwm2Min, pwm2Max);
    pwmval2 = constrain(pwmval2, pwm2Min, pwm2Max);
    

    int pwmval3 = map(val3, analog3Min, analog3Max, pwm3Min, pwm3Max);
    pwmval3 = constrain(pwmval3, pwm3Min, pwm3Max);
    

    int pwmval4 = map(val4, analog4Min, analog4Max, pwm4Min, pwm4Max);
    pwmval4 = constrain(pwmval4, pwm4Min, pwm4Max);


    Serial.print(pwmval0);
    Serial.print(";");
    Serial.print(pwmval1);
    Serial.print(";");
    Serial.print(pwmval2);
    Serial.print(";");
    Serial.print(pwmval3);
    Serial.print(";");
    Serial.println(pwmval4);
  }

  delay(1);
}