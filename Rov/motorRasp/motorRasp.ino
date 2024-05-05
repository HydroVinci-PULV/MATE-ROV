#include<Wire.h>
#include <SoftwareSerial.h>
//#include<PulsePosition.h>

// Définit les pins pour la communication série logicielle
SoftwareSerial mySerial(10, 11); // RX, TX  

/*

!!!!!!!Motor1 est le supérieur gauche
Motor2 supérieur droit
Motor3 inférieur







REPLACE THE PULSEPOSITIONINPUT BASED FUNCTIONS BECAUSE THIS FUCKING PULSEPOSITIONINPUT.H DOESN'T WORK



so basically the functions that get the datas from the operator must be redone
  
 */

int Pinmotor1=1;
int Pinmotor2=2;
int Pinmotor3=3;

int PinmotorH1=4;
int PinmotorH2=5;
int PinmotorH3=6;

float MotorH1, MotorH2, MotorH3;//moteur horizontaux, H1 gauche, H2 droite, H3 arrière
float Motor1, Motor2, Motor3;//moteur verticaux même logique

//float motorThrottle;

float RateRoll, RatePitch, RateYaw;
float RateCalibrationRoll, RateCalibrationPitch, RateCalibrationYaw;
int RateCalibrationNumber;

//PulsePositionInput ReceiverInput(RISING);
float ReceiverValue[]={0, 0, 0, 0, 0, 0, 0, 0};
int ChannelNumber=0; 
float Voltage, Current, BatteryRemaining, BatteryAtStart;
float CurrentConsumed=0;
float BatteryDefault=1300;
uint32_t LoopTimer;
float DesiredRateRoll, DesiredRatePitch,DesiredRateYaw;
float ErrorRateRoll, ErrorRatePitch, ErrorRateYaw;
float InputRoll, InputThrottle, InputPitch, InputYaw;
float PrevErrorRateRoll, PrevErrorRatePitch, PrevErrorRateYaw;
float PrevItermRateRoll, PrevItermRatePitch, PrevItermRateYaw;
float PIDReturn[]={0, 0, 0};
float PRateRoll=0.6; float PRatePitch=PRateRoll; float PRateYaw=2;
float IRateRoll=3.5; float IRatePitch=IRateRoll; float IRateYaw=12;
float DRateRoll=0.03; float DRatePitch=DRateRoll; float DRateYaw=0;
float MotorInput1, MotorInput2, MotorInput3, MotorInput4;
float AccX, AccY, AccZ;
float AngleRoll, AnglePitch;
float KalmanAngleRoll=0, KalmanUncertaintyAngleRoll=2*2;
float KalmanAnglePitch=0, KalmanUncertaintyAnglePitch=2*2;
float Kalman1DOutput[]={0,0};
float DesiredAngleRoll, DesiredAnglePitch;
float ErrorAngleRoll, ErrorAnglePitch;
float PrevErrorAngleRoll, PrevErrorAnglePitch;
float PrevItermAngleRoll, PrevItermAnglePitch;
float PAngleRoll=2; float PAnglePitch=PAngleRoll;
float IAngleRoll=0; float IAnglePitch=IAngleRoll;
float DAngleRoll=0; float DAnglePitch=DAngleRoll;

void kalman_1d(float KalmanState, float KalmanUncertainty, float KalmanInput, float KalmanMeasurement) {
  KalmanState=KalmanState+0.004*KalmanInput;
  KalmanUncertainty=KalmanUncertainty + 0.004 * 0.004 * 4 * 4;
  float KalmanGain=KalmanUncertainty * 1/(1*KalmanUncertainty + 1);
  KalmanState=KalmanState+KalmanGain * (KalmanMeasurement-KalmanState);
  KalmanUncertainty=(1-KalmanGain) * KalmanUncertainty;
  Kalman1DOutput[0]=KalmanState; 
  Kalman1DOutput[1]=KalmanUncertainty;
}



void pid_equation(float Error, float P, float I, float D, float PrevError, float PrevIterm){
  float Pterm=P*Error;
  float Iterm= PrevIterm+I*(Error+PrevError)*0.004/2;
  if (Iterm>400) Iterm=400;
  else if (Iterm<-400) Iterm=-400;
  float Dterm=D*(Error-PrevError)/0.004;
  float PIDOutput=Pterm+Iterm+Dterm;
  if (PIDOutput>400) PIDOutput=400;
  else if (PIDOutput<-400) PIDOutput=-400;
  PIDReturn[0]=PIDOutput;
  PIDReturn[1]=Error;
  PIDReturn[2]=Iterm;
}



void reset_pid(void){
  PrevErrorRateRoll=0; PrevErrorRatePitch=0; PrevErrorRateYaw=0;
  PrevItermRateRoll=0; PrevItermRatePitch=0; PrevItermRateYaw=0;
  PrevErrorAngleRoll=0; PrevErrorAnglePitch=0;    
  PrevItermAngleRoll=0; PrevItermAnglePitch=0;
}





void gyro_signals(void) {
  Wire.beginTransmission(0x68);
  Wire.write(0x1A); 
  Wire.write(0x05);
  Wire.endTransmission();
  Wire.beginTransmission(0x68);
  Wire.write(0x1C);
  Wire.write(0x10);
  Wire.endTransmission();
  Wire.beginTransmission(0x68);
  Wire.write(0x3B);
  Wire.endTransmission(); 
  Wire.requestFrom(0x68,6);
  int16_t AccXLSB = Wire.read() << 8 | Wire.read();
  int16_t AccYLSB = Wire.read() << 8 | Wire.read();
  int16_t AccZLSB = Wire.read() << 8 | Wire.read();
  Wire.beginTransmission(0x68);
  Wire.write(0x1B); 
  Wire.write(0x8);
  Wire.endTransmission();     
  Wire.beginTransmission(0x68);
  Wire.write(0x43);
  Wire.endTransmission();
  Wire.requestFrom(0x68,6);
  int16_t GyroX=Wire.read()<<8 | Wire.read();
  int16_t GyroY=Wire.read()<<8 | Wire.read();
  int16_t GyroZ=Wire.read()<<8 | Wire.read();
  RateRoll=(float)GyroX/65.5;
  RatePitch=(float)GyroY/65.5;
  RateYaw=(float)GyroZ/65.5;
  AccX=(float)AccXLSB/4096;
  AccY=(float)AccYLSB/4096;
  AccZ=(float)AccZLSB/4096;
  AngleRoll=atan(AccY/sqrt(AccX*AccX+AccZ*AccZ))*1/(3.142/180);
  AnglePitch=-atan(AccX/sqrt(AccY*AccY+AccZ*AccZ))*1/(3.142/180);
}


void setup() {
  Serial.begin(57600);//port série matériel (mpu)
  mySerial.begin(9600);//port série logiciel (rasp)
  InputThrottle=0;
  pinMode(13, OUTPUT);
  digitalWrite(13, HIGH);
  Wire.setClock(400000);
  Wire.begin();
  delay(250);
  Wire.beginTransmission(0x68); 
  Wire.write(0x6B);
  Wire.write(0x00);
  Wire.endTransmission();
  /*for (RateCalibrationNumber=0; RateCalibrationNumber<4000; RateCalibrationNumber ++) {
    gyro_signals();
    RateCalibrationRoll+=RateRoll;
    RateCalibrationPitch+=RatePitch;
    RateCalibrationYaw+=RateYaw;
    delay(1);
  }*/
  pinMode(Pinmotor1,OUTPUT);
  pinMode(Pinmotor2,OUTPUT);
  pinMode(Pinmotor3,OUTPUT);
  RateCalibrationRoll/=4000;
  RateCalibrationPitch/=4000;
  RateCalibrationYaw/=4000;
  LoopTimer=micros();
}






void motors(float pitch,float roll,float motorThrottle,float MotorH1, float MotorH2, float MotorH3){
  /*if (pitch>5.0) {digitalWrite(Pinmotor3,motor3+(pitch/90.0)*250.0);digitalWrite(Pinmotor2,motor2);}
  else if (pitch<5.0) {digitalWrite(Pinmotor3,motor3);}//digitalWrite(Pinmotor2,motor2+(abs(pitch)/90.0)*250.0);}

  if (roll>5.0) {digitalWrite(Pinmotor3,motor3+(pitch/90.0)*125.0);digitalWrite(Pinmotor1,motor1);}//digitalWrite(Pinmotor2,motor2+(pitch/90.0)*125.0);}
  else if (roll<5.0) {digitalWrite(Pinmotor1,motor1+(abs(roll)/90.0)*250.0);digitalWrite(Pinmotor3,motor3);}//;digitalWrite(Pinmotor2,motor2);}

  if (abs(roll)<5.0 and abs(pitch)<5.0) {digitalWrite(Pinmotor3,motor3);digitalWrite(Pinmotor1,motor1);}//digitalWrite(Pinmotor2,motor2);}*/
  Motor1=1.024*(motorThrottle-roll-pitch);
  Motor2=1.024*(motorThrottle+roll-pitch);
  Motor3=1.024*(motorThrottle+2*pitch);
  digitalWrite(Pinmotor1,Motor1);
  digitalWrite(Pinmotor2,Motor2);
  digitalWrite(Pinmotor3,Motor3);
  digitalWrite(PinmotorH1,MotorH1);
  digitalWrite(PinmotorH2,MotorH2);
  digitalWrite(PinmotorH3,MotorH3);
}



void loop() {
  gyro_signals();
  //RateRoll-=RateCalibrationRoll;
  //RatePitch-=RateCalibrationPitch;
  //RateYaw-=RateCalibrationYaw;

  
  

//###----get the values of motor1,2 and 3

/*
list of  command for verticals motors:
string: "vg,vd,Va,Z"
*/
  
  if (mySerial.available()>=16)
  {
  //  String received = mySerial.readStringUntil('\n');
    uint8_t data[16];
    float values[4];
    mySerial.readBytes(data,16);
    for (int i=0; i<4;i++)
    {
      memcpy(&values[i], &data[i * 4], sizeof(float));
    }

    MotorH1=values[0];
    MotorH2=values[1];
    MotorH3=values[2];
    InputThrottle=values[3];
  }
  kalman_1d(KalmanAngleRoll, KalmanUncertaintyAngleRoll, RateRoll, AngleRoll);
  KalmanAngleRoll=Kalman1DOutput[0]; 
  KalmanUncertaintyAngleRoll=Kalman1DOutput[1];
  kalman_1d(KalmanAnglePitch, KalmanUncertaintyAnglePitch, RatePitch, AnglePitch);
  KalmanAnglePitch=Kalman1DOutput[0]; 
  KalmanUncertaintyAnglePitch=Kalman1DOutput[1];

  DesiredAngleRoll=0.0;
  DesiredAnglePitch=0.0;  
  //InputThrottle=0;//puissance pour la propulsion verticale
  DesiredRateYaw=0;


  ErrorAngleRoll=DesiredAngleRoll-KalmanAngleRoll;
  ErrorAnglePitch=DesiredAnglePitch-KalmanAnglePitch;
  
  pid_equation(ErrorAngleRoll, PAngleRoll, IAngleRoll, DAngleRoll, PrevErrorAngleRoll, PrevItermAngleRoll);     
  DesiredRateRoll=PIDReturn[0]; 
  PrevErrorAngleRoll=PIDReturn[1];
  PrevItermAngleRoll=PIDReturn[2];

  pid_equation(ErrorAnglePitch, PAnglePitch, IAnglePitch, DAnglePitch, PrevErrorAnglePitch, PrevItermAnglePitch);
  DesiredRatePitch=PIDReturn[0]; 
  PrevErrorAnglePitch=PIDReturn[1];
  PrevItermAnglePitch=PIDReturn[2];

  ErrorRateRoll=DesiredRateRoll-RateRoll;
  ErrorRatePitch=DesiredRatePitch-RatePitch;
  ErrorRateYaw=DesiredRateYaw-RateYaw;

  pid_equation(ErrorRateRoll, PRateRoll, IRateRoll, DRateRoll, PrevErrorRateRoll, PrevItermRateRoll);
       InputRoll=PIDReturn[0];
       PrevErrorRateRoll=PIDReturn[1]; 
       PrevItermRateRoll=PIDReturn[2];
  pid_equation(ErrorRatePitch, PRatePitch,IRatePitch, DRatePitch, PrevErrorRatePitch, PrevItermRatePitch);
       InputPitch=PIDReturn[0]; 
       PrevErrorRatePitch=PIDReturn[1]; 
       PrevItermRatePitch=PIDReturn[2];
  pid_equation(ErrorRateYaw, PRateYaw,IRateYaw, DRateYaw, PrevErrorRateYaw, PrevItermRateYaw);
       InputYaw=PIDReturn[0]; 
       PrevErrorRateYaw=PIDReturn[1]; 
       PrevItermRateYaw=PIDReturn[2];

  ErrorRateRoll=DesiredRateRoll-RateRoll;
  ErrorRatePitch=DesiredRatePitch-RatePitch;
  ErrorRateYaw=DesiredRateYaw-RateYaw;
  
  pid_equation(ErrorRateRoll, PRateRoll, IRateRoll, DRateRoll, PrevErrorRateRoll, PrevItermRateRoll);
       InputRoll=PIDReturn[0];
       PrevErrorRateRoll=PIDReturn[1]; 
       PrevItermRateRoll=PIDReturn[2];
  pid_equation(ErrorRatePitch, PRatePitch,IRatePitch, DRatePitch, PrevErrorRatePitch, PrevItermRatePitch);
       InputPitch=PIDReturn[0]; 
       PrevErrorRatePitch=PIDReturn[1]; 
       PrevItermRatePitch=PIDReturn[2];
  pid_equation(ErrorRateYaw, PRateYaw,IRateYaw, DRateYaw, PrevErrorRateYaw, PrevItermRateYaw);
       InputYaw=PIDReturn[0]; 
       PrevErrorRateYaw=PIDReturn[1]; 
       PrevItermRateYaw=PIDReturn[2];
/*
  Serial.print("InputThrottle");
  Serial.print(InputThrottle);
  Serial.print("InputRoll");
  Serial.print(InputRoll);
  Serial.print("InputPitch");
  Serial.print(InputPitch);
  Serial.print("InputYaw");
  Serial.println(InputYaw);
  */

  
  /*Serial.print("Roll Angle [°] ");
  Serial.print(KalmanAngleRoll+0.96);
  Serial.print(" Pitch Angle [°] ");
  Serial.println(KalmanAnglePitch+1.8);*/
  motors(InputPitch,InputRoll,InputThrottle,MotorH1,MotorH2,MotorH3);
  while (micros() - LoopTimer < 4000);
  LoopTimer=micros();
}



/*
Comment compenser un angle de chute sachant qu'il n'est pas forcément dans un axe stricte?
*/
