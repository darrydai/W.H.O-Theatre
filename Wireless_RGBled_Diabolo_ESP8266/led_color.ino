void led_color(char color,int led,int DelayTime)
{
  int R,G,B;
  if(color == '1')
  {
    R=255;
    G=255;
    B=255;  
  }
  else if(color == '2')
  {
    R=0;
    G=0;
    B=0;  
  }
  else if(color == 'a')
  {
    //Red
    R=255;
    G=0;
    B=0;  
  }
  else if(color == 'b')
  {
    //Orange
    R=255;
    G=165;
    B=0;  
  }
  else if(color == 'c')
  {
    //Yellow
    R=255;
    G=255;
    B=0;  
  }
  else if(color == 'd')
  {
    //Green
    R=0;
    G=255;
    B=0;  
  }
  else if(color == 'e')
  {
    //Blue
    R=0;
    G=0;
    B=255;  
  }
  else if(color == 'f')
  {
    //Cyan
    R=0;
    G=127;
    B=255;  
  }
  else if(color == 'g')
  {
    //purple
    R=139;
    G=0;
    B=255;  
  }
  else if(color == 'h')
  {
    //MediumSpringGreen
    //rainbow(20);
    rainbowCycle(20);
    //theaterChaseRainbow(50); 
  }
  else if(color == 'i')
  {
    //Green
    R=0;
    G=255;
    B=0;           
  }
  else if(color == 'j')
  {
    //GreenYellow
    R=173;
    G=255;
    B=47;  
  }
  else if(color == 'k')
  {
    //Yellow
    R=255;
    G=255;
    B=0;  
  }
  else if(color == 'l')
  {
    //Orange
    R=255;
    G=165;
    B=0;  
  }
  else if(color == 'm')
  {
    //CadiumYellow
    R=255;
    G=153;
    B=18;              
  }
  else if(color == 'n')
  {
    //Red
    R=255;
    G=0;
    B=0;  
  }
  // pixels.Color takes RGB values, from 0,0,0 up to 255,255,255
  for(int i=0;i<led;i++)
  {
    pixels.setPixelColor(i, pixels.Color(R,G,B));
    pixels.show();
    delay(DelayTime);
  }
  /*Serial.println(color);
  Serial.print("R:");
  Serial.println(R);
  Serial.print("G:");
  Serial.println(G);
  Serial.print("B:");
  Serial.println(B);*/  
}

