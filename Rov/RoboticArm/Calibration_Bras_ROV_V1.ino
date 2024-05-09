#include <Adafruit_PWMServoDriver.h>
#include <Wire.h>

// ---------------- Valeurs constantes
const int analogMin = 0;
const int analogMax = 1023;

const int pwmMin = 204;   //120;
const int pwmMax = 1024;  //630;

const int pwmIncr = 20;

const int axes = 5;

const int pinsAnalog[axes] = { A0, A1, A2, A3, A6 };
const int pinsPCA[axes] = { 8, 9, 10, 11, 12 };

Adafruit_PWMServoDriver PCA;

// ---------------- Données de calibration
int CalibrationData[axes][4];

// ---------------- Methode de calibration d'un potentiometre
void setPotentiometerCalibrationData(int index) {
  if (index < 0 || index >= axes) return;

  int pinAnalog = pinsAnalog[index];
  int pinPCA = pinsPCA[index];
  char incomingChar = 0;  // for incoming serial data
  while (Serial.available() > 0) Serial.read();

  PCA.setPWM(pinPCA, 0, CalibrationData[index][2]);
  int currentPosition = 0;
  bool finished = false;
  Serial.println("Mimer la position et envoyer f");
  while (!finished) {
    if (Serial.available() > 0) {
      incomingChar = Serial.read();
      currentPosition = analogRead(pinAnalog);
      if (incomingChar = "f") finished = true;
      }
      currentPosition = analogRead(pinAnalog);
      if (currentPosition == analogMax && !finished) Serial.println("Potentiometre en position maximale !");
      if (currentPosition == analogMin && !finished) Serial.println("Potentiometre en position minimale !");
      delay(5);
    }
  CalibrationData[index][0] = currentPosition;

  while (Serial.available() > 0) Serial.read();
  PCA.setPWM(pinPCA, 0, CalibrationData[index][3]);
  currentPosition = 0;
  finished = false;
  Serial.println("Mimer la position et envoyer f");
  while (!finished) {
    incomingChar = 0;  // for incoming serial data
    if (Serial.available() > 0) {
      incomingChar = Serial.read();
      currentPosition = analogRead(pinAnalog);
      if (incomingChar = "f") finished = true;
      }
      currentPosition = analogRead(pinAnalog);
      if (currentPosition == analogMax && !finished) Serial.println("Potentiometre en position maximale !");
      if (currentPosition == analogMin && !finished) Serial.println("Potentiometre en position minimale !");
      delay(5);
    }
  CalibrationData[index][1] = currentPosition;
}

// ---------------- Methode de calibration d'un servo
void setServoCalibrationData(int index) {
  if (index < 0 || index >= axes) return;

  int pinAnalog = pinsAnalog[index];
  int pinPCA = pinsPCA[index];

  int currentPosition = (CalibrationData[index][2] + CalibrationData[index][3]) / 2;

  bool finished = false;
  Serial.println("Calibration minimale du servo : " + index);
  while (!finished) {
    char incomingChar = 0;  // for incoming serial data
    if (Serial.available() > 0) {
      incomingChar = Serial.read();

      switch (incomingChar) {
        case 'u':
          currentPosition += pwmIncr;
          break;
        case 'd':
          currentPosition -= pwmIncr;
          break;
        case 'f':
          finished = true;
          break;
      }
      currentPosition = constrain(currentPosition, pwmMin, pwmMax);
      if (currentPosition == pwmMax && !finished) Serial.println("Servo en positon maximale !!");
      if (currentPosition == pwmMin && !finished) Serial.println("Servo en positon minimale");
      PCA.setPWM(pinPCA, 0, currentPosition);
      delay(5);
    }
  }
  CalibrationData[index][2] = currentPosition;



  currentPosition = (CalibrationData[index][2] + CalibrationData[index][3]) / 2;

  finished = false;
  Serial.println("Calibration maximale du servo : " + index);
  while (!finished) {
    char incomingChar = 0;  // for incoming serial data
    if (Serial.available() > 0) {
      incomingChar = Serial.read();

      switch (incomingChar) {
        case 'u':
          currentPosition += pwmIncr;
          break;
        case 'd':
          currentPosition -= pwmIncr;
          break;
        case 'f':
          finished = true;
          break;
      }
      currentPosition = constrain(currentPosition, pwmMin, pwmMax);
      if (currentPosition == pwmMax && !finished) Serial.println("Servo en positon maximale");
      if (currentPosition == pwmMin && !finished) Serial.println("Servo en positon minimale !!");
      PCA.setPWM(pinPCA, 0, currentPosition);
      delay(5);
    }
  }
  CalibrationData[index][3] = currentPosition;
}



void setup() {

  for (int i = 0; i < axes; i++) {
    for (int j = 0; j < 4; j++) {
      switch (j) {
        case 0:
          CalibrationData[i][j] = analogMin;
          break;
        case 1:
          CalibrationData[i][j] = analogMax;
          break;
        case 2:
          CalibrationData[i][j] = pwmMin;
          break;
        case 3:
          CalibrationData[i][j] = pwmMax;
          break;
      }
    }
  }

  for (int i = 0; i < axes; i++) {
    pinMode(pinsAnalog[i], INPUT);
  }
  PCA.setPWMFreq(100);
  Serial.begin(9600);
}

void loop() {
  for (int i = 0; i < axes; i++) {
    PCA.setPWM(pinsPCA[i], 0, (CalibrationData[i][2] + CalibrationData[i][3]) / 2);
    delay(1000);
  }

  for (int i = 0; i < axes; i++) {
    setServoCalibrationData(i);
    delay(1000);
    for (int i = 0; i < axes; i++) {
    PCA.setPWM(pinsPCA[i], 0, (CalibrationData[i][2] + CalibrationData[i][3]) / 2);
    
  }
  delay(1000);
  }

  Serial.println("calibration of servos done.");
  for (int i = 0; i < axes; i++) {
    setPotentiometerCalibrationData(i);
    delay(1000);
    for (int i = 0; i < axes; i++) {
    PCA.setPWM(pinsPCA[i], 0, (CalibrationData[i][2] + CalibrationData[i][3]) / 2);
    
  }
  delay(1000);
  }



  for (int i = 0; i < axes; i++){
    Serial.println(" ");
    for (int j = 0; j < 4; j++){
      Serial.print(CalibrationData[i][j]);
      Serial.print(";");
    }
  }

  delay(10000);
  // put your main code here, to run repeatedly:
}
