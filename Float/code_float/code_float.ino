
// CONSTANTS
const float pressureOffSet = 0.478;    // Calibrate with the smallest value at rest
const int pressureDataCount = 180;     // 180 max = 15min / 5sec(each measurement)
const int intervalPressureData = 1000; // 5 seconds

// PIN ASSIGNMENTS
int sens1 = 3;              // Pin sens remplissage
int sens2 = 8;              // Pin sens vidage
int speed = 2;              // Pin vitesse moteur
int wait = 10;              // Couleur pour led RGB
int dive = 11;              // Couleur pour led RGB
int ascent = 12;            // Couleur pour led RGB
int detection = 7;          // Alimentation des butées
int detectLow = A0;         // Butée basse
int detectHigh = A1;        // Butée haute
int pinPressureSensor = A2; // Capteur de pression
int lightSensor = A6;       // Photorésistance
int seuilDetectionL = 980;  // Seuil de détection photorésistance
int seuilDetectionB = 980;  // Seuil de détection butées

unsigned short pressureBit;
unsigned short pressureDataBit[pressureDataCount];
float pressureVoltage, pressureKilopascal;
float pressureDataKilopascal[pressureDataCount];
unsigned long previousMillis = 0;
unsigned long currentMillis = 0;

struct SPressureData
{
  unsigned short pressureBit;
  float pressureVoltage;
  float pressureKilopascal;
};

bool initializeArray(unsigned short arr[], short value = 0)
{
  for (int i = 0; i < sizeArray(arr); i++)
  {
    arr[i] = value;
  }
  return true;
}

void setup()
{
  Serial.begin(9600);

  // Initialize pin modes
  pinMode(sens1, OUTPUT);
  pinMode(sens2, OUTPUT);
  pinMode(speed, OUTPUT);
  pinMode(wait, OUTPUT);
  pinMode(dive, OUTPUT);
  pinMode(ascent, OUTPUT);
  pinMode(detection, OUTPUT);
  pinMode(detectLow, INPUT);
  pinMode(detectHigh, INPUT);

  // Initialize pin values
  digitalWrite(sens1, LOW);
  digitalWrite(sens2, LOW);
  digitalWrite(speed, LOW);
  digitalWrite(wait, LOW);
  digitalWrite(ascent, LOW);
  digitalWrite(dive, LOW);
  digitalWrite(detection, LOW);

  Serial.println("Data sizeof ");
  Serial.println((int)sizeof(pressureDataBit));

  bool initialized = initializeArray(pressureDataBit);
  Serial.println(initialized);

  currentMillis = millis();
}

// Fonction d'attente initiale
void initialWait()
{
  digitalWrite(wait, HIGH);
  delay(100);
  digitalWrite(wait, LOW);
  delay(1400);
}
void waitx(int time) // Fonction d'attente interphase
{
  Serial.println("Wait");
  digitalWrite(wait, HIGH);
  digitalWrite(ascent, LOW);
  digitalWrite(dive, LOW);
  delay(time);
}
void countdown(int time, int phase) // Prévient d'un changement de phase
{
  for (int i = 0; i < time; i++)
  {
    digitalWrite(phase, HIGH);
    delay(500);
    digitalWrite(phase, LOW);
    delay(500);
  }
}
void divex(int fillingSpeed) // Fonction de plongée
{
  Serial.println("Dive");
  digitalWrite(wait, LOW);
  digitalWrite(ascent, LOW);
  digitalWrite(dive, HIGH);
  delay(2000);
  digitalWrite(detection, HIGH);
  while (analogRead(detectHigh) < seuilDetectionB)
  {
    digitalWrite(sens1, HIGH);
    digitalWrite(sens2, LOW);
    analogWrite(speed, fillingSpeed);
  }
  digitalWrite(detection, LOW);
  digitalWrite(sens1, LOW);
  digitalWrite(sens2, LOW);
  digitalWrite(dive, LOW);
  analogWrite(speed, 0);
}
void ascentx(int fillingSpeed) // Fonction d'ascension
{
  Serial.println("Ascent");
  digitalWrite(wait, LOW);
  digitalWrite(ascent, HIGH);
  digitalWrite(dive, LOW);
  delay(2000);
  digitalWrite(detection, HIGH);

  while (analogRead(detectLow) < seuilDetectionB)
  {
    digitalWrite(sens1, LOW);
    digitalWrite(sens2, HIGH);
    analogWrite(speed, fillingSpeed);
  }
  digitalWrite(detection, LOW);
  digitalWrite(sens1, LOW);
  digitalWrite(sens2, LOW);
  digitalWrite(ascent, LOW);
  analogWrite(speed, 0);
}

int count(unsigned short arr[])
{
  int i;
  int count = 0;
  for (i = 0; arr[i] != '\0'; i++)
  {
    count++;
  }
  return count;
}
int sizeArray(unsigned short arr[])
{
  return sizeof(arr) / sizeof(arr[0]);
}

bool filterData()
{
}

SPressureData collectPressureData(int pinPressureSensor, bool debug = false)
{
  pressureBit = analogRead(pinPressureSensor);
  pressureVoltage = pressureBit * 5.00 / 1024;                   // Sensor output voltage
  pressureKilopascal = (pressureVoltage - pressureOffSet) * 250; // Calculate water pressure

  if (debug)
    Serial.println("Recording pressure");
  // Serial.print("Voltage:");
  // Serial.print(pressureVoltage, 3);

  SPressureData pressureData = {pressureBit, pressureVoltage, pressureKilopascal};
  return pressureData;
}

int storePressureData(
    SPressureData inputPressure,
    unsigned short pressureDataBit[],
    float pressureDataKilopascal[])
{
  bool dataStored = true;
  int index = addShortToLastAvailableIndex(inputPressure.pressureBit, pressureDataBit);
  int indexKilopascal = addFloatToLastAvailableIndex(inputPressure.pressureKilopascal, pressureDataKilopascal);

  if (index <= -1)
  {
    dataStored = false;
  }
  // return dataStored;
  return index;
}
int recordPressureData()
{

  Serial.println("Data recording ");

  SPressureData pressureData = collectPressureData(pinPressureSensor);

  // Serial.println(pressureData.pressureBit);
  // Serial.println(pressureData.pressureVoltage);
  // Serial.println(pressureData.pressureKilopascal);

  int isStored = storePressureData(pressureData, pressureDataBit, pressureDataKilopascal);

  Serial.print("DataCount ");
  Serial.print(isStored);
  Serial.print(" \t ");
  Serial.print("Pressure ");
  Serial.print(pressureData.pressureKilopascal);
  Serial.print(" \r\n ");

  // printDataArray(pressureDataBit);

  if (!isStored)
  {
    // Serial.println("Data not stored");
  }
  // printData(collectPressureData(pinPressureSensor).pressureKilopascal);

  // printDataArray(pressureDataBit);
}

bool isDataFull()
{
}

void plotPressureData()
{
}
void ascentIfPressureStable()
{
}
void sendDataThroughBluetooth()
{
}

// UTILS
void printDataArray(unsigned short array[], bool debug = false)
{
  int countArray = count(array);
  Serial.print("Data : ");
  Serial.print(countArray);
  Serial.print(" : ");
  for (int i = 0; i < countArray; i++)
  {
    // Serial.print(i);
    if (debug)
    {
      Serial.print(array[i]);
      Serial.print(", ");
    }
  }
  Serial.println();
}
void printData(float value, int length = 1)
{
  Serial.print("Data : ");
  Serial.print(value, length);
  Serial.println("; ");
}
int addShortToLastAvailableIndex(unsigned short value, unsigned short array[])
{
  // int count = *(&array + 1) - array;
  // Serial.print("Count : ");
  // Serial.println(count);
  int i = 0;
  while (array[i] != 0 && array[i] != '\0')
  {
    i++;
  }
  array[i] = value;
  return i;
}
int addFloatToLastAvailableIndex(float value, float array[])
{

  int count = sizeof(array) / sizeof(array[0]);
  for (int i = 0; i < count; i++)
  {
    // Serial.println(i);
    if (array[i] == 0)
    {
      array[i] = value;
      // Serial.println(array[i]);
      return i;
    }
  }
  return -1;
}
void floatDelayProcedureSequence()
{
  Serial.println("Float delay procedure sequence");
  recordPressureData();
  while (analogRead(lightSensor) < seuilDetectionL)
  {
    initialWait();
  }
  recordPressureData();
  ascentx(255);
  recordPressureData();
  // Initial waiting time
  waitx(5000);
  countdown(5, wait);
  recordPressureData();
  // Initiating dive
  divex(255);
  recordPressureData();
  // Mid-waiting
  waitx(5000);
  countdown(5, wait);
  recordPressureData();
  // Initiating ascent
  ascentx(255);
  recordPressureData();
  // Final waiting
  waitx(5000);
  countdown(5, wait);
  recordPressureData();
}
void floatProcedureSequence()
{

  while (analogRead(lightSensor) < seuilDetectionL)
  {
    initialWait();
  }
}
unsigned long actionOnInterval(unsigned long currentMillis, unsigned long previousMillis, int interval, void (*function)())
{
  if (currentMillis - previousMillis >= interval)
  {
    previousMillis = currentMillis;
    function();
  }
  return previousMillis;
}

void loop()
{

  // previousMillis = actionOnInterval(currentMillis, previousMillis, intervalPressureData, recordPressureData);

  // recordPressureData();

  // delay(100);
  floatDelayProcedureSequence();
}
