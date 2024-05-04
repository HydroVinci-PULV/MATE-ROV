int sens1 = 3; //Pin sens remplissage
int sens2 = 8; //Pin sens vidage
int speed = 2; //Pin vitesse moteur
int wait = 10; //Couleur pour led RGB
int dive = 11; //Couleur pour led RGB
int ascent = 12; //Couleur pour led RGB
int detection = 7; //Alimentation des butées
int detectLow = A0; //Butée basse
int detectHigh = A1; //Butée haute
int pressureSensor = A2; //Capteur de pression
int lightSensor = A6; //Photorésistance
int seuilDetectionL = 980; //Seuil de détection photorésistance
int seuilDetectionB = 980; //Seuil de détection butées

void setup()
{
  Serial.begin(9600);
  pinMode(sens1, OUTPUT);
  pinMode(sens2, OUTPUT);
  pinMode(speed, OUTPUT);
  pinMode(wait, OUTPUT);
  pinMode(dive, OUTPUT);
  pinMode(ascent, OUTPUT);
  pinMode(detection, OUTPUT);
  pinMode(detectLow, INPUT);
  pinMode(detectHigh, INPUT);

  digitalWrite(sens1, LOW);
  digitalWrite(sens2, LOW);
  digitalWrite(speed, LOW);
  digitalWrite(wait, LOW);
  digitalWrite(ascent, LOW);
  digitalWrite(dive, LOW);
  digitalWrite(detection, LOW);
}
void initialWait() //Fonction d'attente initiale
{
  digitalWrite(wait, HIGH);
  delay(100);
  digitalWrite(wait, LOW);
  delay(1400);
}
void waitx(int time) //Fonction d'attente interphase
{
  digitalWrite(wait, HIGH);
  digitalWrite(ascent, LOW);
  digitalWrite(dive, LOW);
  delay(time);
}
void countdown(int time, int phase) //Prévient d'un changement de phase
{
  for(int i = 0; i<time; i++)
  {
    digitalWrite(phase, HIGH);
    delay(500);
    digitalWrite(phase, LOW);
    delay(500);
  }
}
void divex(int fillingSpeed) //Fonction de plongée
{
  digitalWrite(wait, LOW);
  digitalWrite(ascent, LOW);
  digitalWrite(dive, HIGH);
  delay(2000);
  digitalWrite(detection, HIGH);
  while(analogRead(detectHigh)<seuilDetectionB)
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
void ascentx(int fillingSpeed) //Fonction d'ascension
{
  digitalWrite(wait, LOW);
  digitalWrite(ascent, HIGH);
  digitalWrite(dive, LOW);
  delay(2000);
  digitalWrite(detection, HIGH);
  
  while(analogRead(detectLow)<seuilDetectionB)
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


void loop()
{
  while(analogRead(lightSensor)<seuilDetectionL)
  {
    initialWait();
  }
  ascentx(255);

  //Initial waiting time
  waitx(5000);
  countdown(5, wait);

  //Initiating dive
  divex(255);

  //Mid-waiting
  waitx(5000);
  countdown(5, wait);

  //Initiating ascent
  ascentx(255);

  //Final waiting
  waitx(5000);
  countdown(5, wait);
}
