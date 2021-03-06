#include <OSCBundle.h> 
#include <OSCMessage.h>
#include <ESP8266WiFi.h>
#include <WiFiUdp.h>
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>

WiFiUDP Udp;                           // A UDP instance to let us send and receive packets over UDP
const IPAddress destIp(192,168,1,84);   // remote IP of the target device
const unsigned int destPort = 9000;    // remote port of the target device where the NodeMCU sends OSC to
const unsigned int localPort = 8000;

const char* ssid = "whoslab";
const char* password = "Whotheatre";
//const char* ssid = "61h8f";
//const char* password = "58585858";

volatile float acceX,acceY,acceZ,vector_X,vector_Y,vector_Z;

OSCErrorCode error;
Adafruit_BNO055 bno = Adafruit_BNO055();

void setup() {
  pinMode(2, OUTPUT);
  Serial.begin(115200);
  wifi_init();
  gyroSensorInit();
}

void loop() 
{
  gyro_state();
  Send_vector();
  //if(acceX>0)
  //{
    Send_acceX();
  //}
  //else
  //{
    //Send_acceZero();
  //}
}
