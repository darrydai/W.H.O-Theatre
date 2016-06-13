// NeoPixel Ring simple sketch (c) 2013 Shae Erisson
// released under the GPLv3 license to match the rest of the AdaFruit NeoPixel library
#include <SPI.h>
#include <Ethernet.h>
#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
  #include <avr/power.h>
#endif

// Which pin on the Arduino is connected to the NeoPixels?
// On a Trinket or Gemma we suggest changing this to 1
#define PIN            6

// How many NeoPixels are attached to the Arduino?
#define NUMPIXELS      40

// When we setup the NeoPixel library, we tell it how many pixels, and which pin to use to send signals.
// Note that for older NeoPixel strips you might need to change the third parameter--see the strandtest
// example for more information on possible values.
Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);

int delayval = 100; // delay for half a second

boolean incoming = 0;

int R;
int G;
int B;
int var1 = 0;
int var2 = 0;

byte mac[] = { 0x90, 0xA2, 0xDA, 0x0D, 0x72, 0x12 };
IPAddress ip(192,168,1,47);

EthernetServer server(80);

void setup() 
{
  Ethernet.begin(mac, ip);
  server.begin();
  // This is for Trinket 5V 16MHz, you can remove these three lines if you are not using a Trinket
#if defined (__AVR_ATtiny85__)
  if (F_CPU == 16000000) clock_prescale_set(clock_div_1);
#endif
  // End of trinket special code
  pixels.begin(); // This initializes the NeoPixel library.
  Serial.begin(9600);
}

void loop() 
{
  EthernetClient client = server.available();
  if (client) 
  {
    Serial.print("Plz type the commend");
    boolean currentLineIsBlank = true;
    while (client.connected())
    {
      if (client.available())
      {
        char c = client.read();
        if(incoming && c == ' ')
        {
          incoming = 0;
        }
        if(c == '$')
        {
          incoming = 1; 
        }
        if(incoming == 1)
        {
          Serial.println(c);
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
            if(c == '\n')
            {
              currentLineIsBlank = true;
            }
            else if (c != '\r')
            {
              currentLineIsBlank = false;
            }
            for(int i=0;i<NUMPIXELS;i++)
            {
              // pixels.Color takes RGB values, from 0,0,0 up to 255,255,255
              pixels.setPixelColor(i, pixels.Color(R,G,B)); // Moderately bright green color.
              pixels.show(); // This sends the updated pixel color to the hardware.
              delay(delayval); // Delay for a period of time (in milliseconds).
            }
          }
        }
      }
    }
    
  // For a set of NeoPixels the first NeoPixel is 0, second is 1, all the way up to the count of pixels minus one.

  for(int i=0;i<NUMPIXELS;i++)
  {

    // pixels.Color takes RGB values, from 0,0,0 up to 255,255,255
    pixels.setPixelColor(i, pixels.Color(R,G,B)); // Moderately bright green color.

    pixels.show(); // This sends the updated pixel color to the hardware.

    delay(delayval); // Delay for a period of time (in milliseconds).

  }
}
