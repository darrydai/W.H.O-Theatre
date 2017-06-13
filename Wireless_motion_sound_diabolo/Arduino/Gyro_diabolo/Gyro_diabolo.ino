#include <OSCBundle.h> 
#include <OSCMessage.h>
#include <ESP8266WiFi.h>
#include <WiFiUdp.h>
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>

WiFiUDP Udp;                           // A UDP instance to let us send and receive packets over UDP
const IPAddress destIp(192,168,1,50);   // remote IP of the target device
const unsigned int destPort = 9000;    // remote port of the target device where the NodeMCU sends OSC to
const unsigned int localPort = 8000;

const char* ssid = "www.facebook.com/escher.tsai";
const char* password = "25063990";

volatile uint16_t acceX,acceY,acceZ;

OSCErrorCode error;
Adafruit_BNO055 bno = Adafruit_BNO055();

void setup() {
  Serial.begin(115200);
  wifi_init();
  gyroSensorInit();
}

void loop() 
{
  gyro_state();
  if(acceX>15)
  {
    Send_acceX();
  }
//  else if(acceY>15)
//  {
//    Send_acceY();
//  }
//  else if(acceZ>15)
//  {
//    Send_acceZ();
//  }
  else
  {
    Send_zero();
  }
}
