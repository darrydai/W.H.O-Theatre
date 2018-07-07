void rgbFadeInAndOut(uint8_t red, uint8_t green, uint8_t blue, uint8_t wait) 
{
  for(uint8_t i=0; i < PixelNum; i+=3)
  {
     for(uint8_t b = 0; b <255; b+=10) 
     {
        pixels.setPixelColor(i, red * b/255, green * b/255, blue * b/255);
     }
     pixels.show();
     delay(wait);
  }
}
