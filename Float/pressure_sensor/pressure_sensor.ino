/*!
 * @file  SEN0257.ino
 * @brief  Water pressure sensor demo(Computer serial port)
 * @n      - Obtain the water pressure through the output voltage
 * @n        of the sensor.
 * @copyright  Copyright (c) 2010 DFRobot Co.Ltd (http://www.dfrobot.com)
 * @license  The MIT License (MIT)
 * @author  DFRobot
 * @version  V1.0
 * @date  2023-07-06
 */

/************************************************************
  Water Sensor Key Parameter
  - Parts No.:KY-3-5
  - Sensing range: 0 - 1 MPa
  - Input Voltage: 5VDC
  - Output Voltage: 0.5 - 4.5 VDC
    (Linearly corresponding to 0 - 1 MPa)
  - Accuary: 0.5% - 1% FS
**************************************************************/

/************************************************************
  Water Sensor Calibration

  The output voltage offset of the sensor is 0.5V (norminal).
  However, due to the zero-drifting of the internal circuit, the
  no-load output voltage is not exactly 0.5V. Calibration needs to
  be carried out as follow.

  Calibration: connect the 3 pin wire to the Arduio UNO (VCC, GND and Signal)
  without connecting the sensor to the water pipe and run the program
  for once. Mark down the LOWEST voltage value through the serial
  monitor and revise the "OffSet" value to complete the calibration.

  After the calibration the sensor is ready for measuring!
**************************************************************/

const float OffSet = 0.478;

float V, P;

void setup()
{
    Serial.begin(9600); // open serial port, set the baud rate to 9600 bps
    Serial.println("/** Water pressure sensor demo **/");
}
void loop()
{
    // Connect sensor to Analog 0
    V = analogRead(0) * 5.00 / 1024; // Sensor output voltage
    P = (V - OffSet) * 250;          // Calculate water pressure

    Serial.print("Voltage:");
    Serial.print(V, 3);
    Serial.println("V");

    Serial.print(" Pressure:");
    Serial.print(P, 3);
    Serial.println(" KPa");
    Serial.println();

    delay(1000);
}