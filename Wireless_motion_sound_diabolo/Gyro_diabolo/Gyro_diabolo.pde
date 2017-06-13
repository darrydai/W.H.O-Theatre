import oscP5.*;
import netP5.*;
import ddf.minim.*;

Minim d1;
Minim d2;
Minim d3;
Minim d4;
Minim d5;

AudioPlayer diaboloOneSound;
AudioPlayer diaboloTwoSound;
AudioPlayer diaboloThreeSound;
AudioPlayer diaboloFourSound;
AudioPlayer diaboloFiveSound;

OscP5 oscP5;
NetAddress myRemoteLocation;

UI diaboloOneUI;
UI diaboloTwoUI;
UI diaboloThreeUI;
UI diaboloFourUI;
UI diaboloFiveUI;

void setup() {
  size(1350,400);
  readConfig();
  smooth();
  frameRate(60);
  
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,9000);
  
  myRemoteLocation = new NetAddress("192.168.1.50",9000);
  
  diaboloOneUI = new UI();
  diaboloTwoUI = new UI();
  diaboloThreeUI = new UI();
  diaboloFourUI = new UI();
  diaboloFiveUI = new UI();
  
  d1 = new Minim(this);
  d2 = new Minim(this);
  d3 = new Minim(this);
  d4 = new Minim(this);
  d5 = new Minim(this);
  
  diaboloOneSound = d1.loadFile(soundOne);
  diaboloTwoSound = d1.loadFile(soundTwo);
  diaboloThreeSound = d3.loadFile(soundThree);
  diaboloFourSound = d4.loadFile(soundFour);
  diaboloFiveSound = d5.loadFile(soundFive);

  //delay(1000);
}


final void draw() {
  background(0);
  
  diaboloOneUI.drawTheBlock(133,135,150,150);
  diaboloTwoUI.drawTheBlock(403,135,150,150);
  diaboloThreeUI.drawTheBlock(673,135,150,150);
  diaboloFourUI.drawTheBlock(943,135,150,150);
  diaboloFourUI.drawTheBlock(1213,135,150,150);
  //draw_animation();
  
  if(diaboloOneUI.diaboloConnectStatus==true)
  {
    diaboloOneUI.checkAndPlayFile(diaboloOneAcce[0],1);
    diaboloOneUI.AnalyzeSound(58,0,1);
  }
  if(diaboloTwoUI.diaboloConnectStatus==true)
  {
    diaboloTwoUI.checkAndPlayFile(diaboloTwoAcce[0],2);
    diaboloTwoUI.AnalyzeSound(328,0,2);
  }
  if(diaboloThreeUI.diaboloConnectStatus==true)
  {
    diaboloThreeUI.checkAndPlayFile(diaboloThreeAcce[0],3);
    diaboloThreeUI.AnalyzeSound(598,0,3);
  }
  if(diaboloFourUI.diaboloConnectStatus==true)
  {
    diaboloFourUI.checkAndPlayFile(diaboloFourAcce[0],4);
    diaboloFourUI.AnalyzeSound(868,0,4);
  }
  if(diaboloFiveUI.diaboloConnectStatus==true)
  {
    diaboloFiveUI.checkAndPlayFile(diaboloFiveAcce[0],5);
    diaboloFiveUI.AnalyzeSound(1138,0,5);
  }
  
  diaboloOneUI.imformation(diaboloOneAcce,0,0);
  diaboloTwoUI.imformation(diaboloTwoAcce,270,0);
  diaboloThreeUI.imformation(diaboloThreeAcce,540,0);
  diaboloFourUI.imformation(diaboloFourAcce,810,0);
  diaboloFourUI.imformation(diaboloFiveAcce,1080,0);
}

void stop()
{
  d1.stop();
  d2.stop();
  d3.stop();
  d4.stop();
  d5.stop();
  super.stop();
}