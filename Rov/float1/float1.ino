//include <EEPROM.h>
#include <SimpleDHT.h>
#include <RCSwitch.h>



int adress=0; 
int in1Pin = 11;
int in2Pin = 9; //broches de contrôle du moteur
//unsigned long startTime;//pour mesurer les tp de départ des moteurs
int sensorPin = 5; //broche d'un capteur
//int toursEffectues = 0;       // Compteur de tours
const int enablePin=7
RCSwitch mySwitch=RCSwitch();
/*
Il faut faire les algos de communication et de récupération de donnés, voir comment gérer les signaux pour activer le start 
et interpréter la profondeur. Ainsi que tester le tt qd on pourras utiliser les batteries.
*/


void setup() {
  // Configuration des broches en entrée/sortie

  pinMode(in1Pin, OUTPUT);
  digitalWrite(in1Pin,LOW);
  pinMode(in2Pin, OUTPUT);
  digitalWrite(in2Pin,LOW);//on mes les pin low pour que le moteur ne tourne pas dès le debut
  pinMode(sensorPin, INPUT);
  analogWrite(enablePin,150);
  Serial.begin(9600);
  //mySwitch.enableTransmit(10);
}

void loop() {
  // Vérifier si le bouton est enfoncé
  if (digitalRead(sensorpin) == HIGH) {
    // allumer le moteur
    communication();
    for (int i=0;i<2;i++){
    digitalWrite(in1Pin,HIGH);
    start();
    communication();
    data=reset_data();
    }
    break;
    }
  
}

void communication(data){
       mySwitch.enableTransmit(10);
       if (strlen(data)==0) mySwitch.send(default_data);
       else mySwitch.send(data);
       mySwitch.disableTransmit();
  }


void start()
{   
    //int valeurCapteur=analogRead(A0)
    //on attends x secondes
    recolte_de_donnés();
    
    delay(1000);
    //coupe le moteur
    digitalWrite(in1pin,LOW);
    /*unsigned long currentTime=millis();
    // Attendre que le tp soit écoulé
    if (currentTime-starTime>1000){
      digitalWrite(in1Pin,LOW);
      
    }*/
    if (profondeur>3){
      digitalWrite(in2pin, HIGH);
      delay(1000);
      digitalWrite(in2pin,LOW);
    }
  }
