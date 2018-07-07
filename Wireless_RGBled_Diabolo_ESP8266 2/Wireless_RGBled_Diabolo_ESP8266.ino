#include <ESP8266WiFi.h>

#include <Adafruit_NeoPixel.h>
#include <EEPROM.h>

#define Led_Data D2
#define PixelNum 18

Adafruit_NeoPixel pixels = Adafruit_NeoPixel(PixelNum, Led_Data, NEO_GRB + NEO_KHZ800);

WiFiServer server(80); //Initialize the server on Port 80

//const char* ssid = "www.facebook.com/escher.tsai";
//const char* ssid = "dimensionplus";
//const char* password = "25063990";

//const char* ssid = "TP-LINK_3416";
//const char* password = "0987054451";

const char* ssid = "whoslab";
const char* password = "Whotheatre";

boolean incoming = 0;

int Brightness = 15;

void setup() 
{
  //WiFi.mode(WIFI_AP);
  WiFi.mode(WIFI_STA);
  //WiFi.softAP("W_H_O_Theatre", "12345678");
  //pinMode(Led_Data,OUTPUT);
  server.begin();
  pixels.begin();
  pinMode(2,OUTPUT);
  //pinMode(D2,OUTPUT);
  Serial.begin(115200);
  delay(10);
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  
  while (WiFi.status() != WL_CONNECTED) 
  {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
  digitalWrite(2,LOW);
  // Start the server
  server.begin();
  Serial.println("Server started");

  IPAddress HTTPS_ServerIP= WiFi.localIP();
  Serial.print("Server IP is: ");
  Serial.println(HTTPS_ServerIP);
  
  //Print the IP address
  Serial.println(WiFi.localIP());
  for(int i=0;i<PixelNum;i+=3)
  {
    pixels.setPixelColor(i, pixels.Color(255,255,255));
    pixels.show();
    delay(1);
  }
}

void loop()
{
  WiFiClient client = server.available();
  if (!client) 
  { 
    return;
  }
  while(!client.available()){
    delay(1);
  }
  if (client) 
  {
    while (client.connected())
    {
      if (client.available())
      {
        char color_select = client.read();
        /*for(int i=0;i<PixelNum;i++)
        {
          pixels.setPixelColor(i, pixels.Color(0,255,0));
          pixels.show();
        }*/
        //Serial.println("Ready");
        if(incoming && color_select == ' ')
        {
          incoming = 0;
        }
        if(color_select == '$')
        {
          Serial.println("ready");
          incoming = 1; 
        }
        else if(incoming == 1)
        {
          Serial.println(color_select);
          led_color(color_select,PixelNum);
          for (int i = 0 ; i < 4096 ; i++) 
          {
            EEPROM.write(i, 0);
          }
        }
      }
    }
  }
  delay(1);
  client.stop();
}

