#include "I2Cdev.h"
#include "MPU6050.h" // include the accelerometer library
MPU6050 accelgyro;  // set device to MPU6050
int16_t ax, ay, az, gx, gy, gz;  // define accel as ax,ay,az          
int baselineX = 0;

void setup() {
  Wire.begin();      // join I2C bus   
  Serial.begin(9600);    //  initialize serial communication
  accelgyro.initialize();  // initialize the accelerometer
  accelgyro.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);
  baselineX = ax;
}
void loop() {
  accelgyro.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);  // read measurements from device
  //Serial.println(ax);
  Serial.println(800+ (gz-baselineX)*0.05);
  //Serial.println(abs(gz-baselineX)*0.1);
  delay(2);
}

//turn left: value>500, turnn right: value<500
