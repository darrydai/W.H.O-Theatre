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
    //Hotpink
    R=255;
    G=105;
    B=180;  
  }
  else if(color == 'b')
  {
    //Magenta
    R=255;
    G=0;
    B=255;  
  }
  else if(color == 'c')
  {
    //Darkochild1
    R=191;
    G=62;
    B=255;  
  }
  else if(color == 'd')
  {
    //Blue
    R=0;
    G=0;
    B=255;  
  }
  else if(color == 'e')
  {
    //darkSkyBlue
    R=0;
    G=160;
    B=255;  
  }
  else if(color == 'f')
  {
    //Turquoise
    R=0;
    G=200;
    B=255;  
  }
  else if(color == 'g')
  {
    //Cyan
    R=0;
    G=255;
    B=255;  
  }
  else if(color == 'h')
  {
    //MediumSpringGreen
    R=0;
    G=255;
    B=154;  
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
  Serial.print("R:");
  Serial.println(R);
  Serial.print("G:");
  Serial.println(G);
  Serial.print("B:");
  Serial.println(B);  
}

