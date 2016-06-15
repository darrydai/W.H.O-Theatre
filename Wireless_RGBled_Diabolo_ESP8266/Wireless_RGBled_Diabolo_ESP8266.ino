#include <ESP8266WiFi.h>

#include <Adafruit_NeoPixel.h>

#define Led_Data 2
#define PixelNum 20

Adafruit_NeoPixel pixels = Adafruit_NeoPixel(PixelNum, Led_Data, NEO_GRB + NEO_KHZ800);

WiFiServer server(80); //Initialize the server on Port 80

const char* ssid = "www.facebook.com/escher.tsai";
const char* password = "25063990";

int DelayTime = 100;
boolean incoming = 0;
int R,G,B;

void setup() 
{
  Serial.begin(115200);
  delay(10);
  pinMode(2,OUTPUT);
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  pixels.begin(); 
  while (WiFi.status() != WL_CONNECTED) 
  {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
  
  // Start the server
  server.begin();
  Serial.println("Server started");

  // Print the IP address
  Serial.println(WiFi.localIP());
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
        char c = client.read();
        Serial.println(c);
        if(incoming && c == ' ')
        {
          incoming = 0;
        }
        if(c == '$')
        {
          Serial.println("ready");
          incoming = 1; 
        }
        if(incoming == 1)
        {
          if(c=='1')
          {
            R=255;
            G=255;
            B=255;
          }
          if(c=='2')
          {
            R=0;
            G=0;
            B=0;
          }
          if(c=='a')
          {
            R=255;
            G=90;
            B=180;
          }
          if(c=='b')
          {
            R=255;
            G=0;
            B=255;
          }
          if(c=='c')
          {
            R=191;
            G=62;
            B=255;
          }
          if(c=='d')
          {
            R=0;
            G=0;
            B=255;
          }
          if(c=='e')
          {
            R=0;
            G=160;
            B=255;
          }
          for(int i=0;i<PixelNum;i++)
          {
            // pixels.Color takes RGB values, from 0,0,0 up to 255,255,255
            pixels.setPixelColor(i, pixels.Color(R,G,B)); // Moderately bright green color.
            pixels.show(); // This sends the updated pixel color to the hardware.
            delay(DelayTime); // Delay for a period of time (in milliseconds).
          }
        }
      }
    }
  }
}

