// Turns an Arduino Nano ESP32 into a Bluetooth® Low Energy peripheral.
// This BLE peripheral is providing a service that allows a BLE central
// to switch on and off the internal LED of the Arduino Nano ESP32.
// https://tutoduino.fr/
// Copyleft 2023

// #include "ArduinoLibraryFiles.ino"
#include <ArduinoBLE.h>

// #include "driver/temp_sensor.h"

BLEService ledService("19b10000-e8f2-537e-4f6c-d104768a1214"); // Bluetooth® Low Energy LED Service
// Bluetooth® Low Energy LED Switch Characteristic - custom 128-bit UUID, read and writable by central
BLEByteCharacteristic switchCharacteristic("19b10000-e8f2-537e-4f6c-d104768a1214", BLERead | BLEWrite);
// BLEServiece rangeService("");
const int ledPin = LED_BUILTIN; // internal LED pin

void setup()
{
    Serial.begin(9600);
    // set LED pin to output mode
    pinMode(ledPin, OUTPUT);
    // BLE initialization
    if (!BLE.begin())
    {
        Serial.println("starting Bluetooth® Low Energy module failed!");
        while (1)
            ;
    }
    // set advertised local name and service UUID:
    BLE.setLocalName("ArduinoESP32");
    BLE.setAdvertisedService(ledService);
    // add the characteristic to the service
    ledService.addCharacteristic(switchCharacteristic);
    // add service
    BLE.addService(ledService);
    // set the initial value for the characeristic:
    switchCharacteristic.writeValue(0);
    // start advertising
    BLE.advertise();
    Serial.println("BLE LED Peripheral");

    int debug = debugLibrary(1);
    Serial.println("debugLibrary: ");
    Serial.println(debug);
}
void loop()
{
    /*
    // float cpu_temperature;
    uint8_t manufactData[] = {0x01};
    // read the internal temperature sensor
    // temp_sensor_read_celsius(&cpu_temperature);
    manufactData[0] = uint8_t(cpu_temperature);
    // Build advertising data packet (temperature is first byte of manufacturer data)
    BLEAdvertisingData advData;
    advData.setLocalName("ArduinoESP32");
    // Set parameters for advertising packet
    advData.setManufacturerData(0x09A3, manufactData, sizeof(manufactData));
    // Copy set parameters in the actual advertising packet
    BLE.setAdvertisingData(advData);
    // advertise during 2 seconds
    BLE.advertise();
    delay(2000);
    BLE.stopAdvertise();
    // enter deep sleep for 1 minute
    // esp_sleep_enable_timer_wakeup(60000000);
    // esp_deep_sleep_start();
    */
}