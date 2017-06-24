import oscP5.*;
import netP5.*;
import ddf.minim.*;

void setup() {
  size(1350,400);
  smooth();
  frameRate(60);
  
  readConfig();
  
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,9000);
  
  myRemoteLocation = new NetAddress("192.168.0.101",9000);
  
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
  diaboloTwoSound = d1.loadFile(soundTwo,2048);
  diaboloThreeSound = d3.loadFile(soundThree);
  diaboloFourSound = d4.loadFile(soundFour);
  diaboloFiveSound = d5.loadFile(soundFive);
  //diaboloTwoSound.loop();
}


void draw() {
  try{
    background(0);
    //---------------------UI----------------------
    diaboloOneUI.drawTheCircle(133,135,150,150);
    diaboloTwoUI.drawTheCircle(403,135,150,150);
    diaboloThreeUI.drawTheCircle(673,135,150,150);
    diaboloFourUI.drawTheCircle(943,135,150,150);
    diaboloFourUI.drawTheCircle(1213,135,150,150);
    
    //diaboloTwoUI.montion_Transfor(diaboloTwoUI.diaboloOrientation[0]);
    //diaboloTwoSound.setGain(diaboloOneUI.motionTransforGain);
    //----------Check diabolo Connected the system , play and visualization the sound----------
    if(diaboloOneUI.diaboloConnectStatus==true)
    {
      diaboloOneUI.checkAndPlayFile(diaboloOneUI.diaboloAcce[1],1);
      diaboloOneUI.AnalyzeSound(58,0,1);
    }
    if(diaboloTwoUI.diaboloConnectStatus==true)
    {
      //diaboloTwoUI.montion_Transfor(diaboloTwoUI.diaboloOrientation);
      //diaboloTwoSound.setGain(diaboloTwoUI.motionTransforGain);
      diaboloTwoUI.checkAndPlayFile(diaboloTwoUI.diaboloAcce[1],2);
      diaboloTwoUI.AnalyzeSound(328,0,2);
    }
    if(diaboloThreeUI.diaboloConnectStatus==true)
    {
      diaboloThreeUI.checkAndPlayFile(diaboloThreeUI.diaboloAcce[0],3);
      diaboloThreeUI.AnalyzeSound(598,0,3);
    }
    if(diaboloFourUI.diaboloConnectStatus==true)
    {
      diaboloFourUI.checkAndPlayFile(diaboloFourUI.diaboloAcce[0],4);
      diaboloFourUI.AnalyzeSound(868,0,4);
    }
    if(diaboloFiveUI.diaboloConnectStatus==true)
    {
      diaboloFiveUI.checkAndPlayFile(diaboloFiveUI.diaboloAcce[0],5);
      diaboloFiveUI.AnalyzeSound(1138,0,5);
    }
    
    //------Show the imformation on screen------------------------
    diaboloOneUI.imformation(diaboloOneUI.diaboloAcce,0,0);
    diaboloTwoUI.imformation(diaboloTwoUI.diaboloAcce,270,0);
    diaboloThreeUI.imformation(diaboloThreeUI.diaboloAcce,540,0);
    diaboloFourUI.imformation(diaboloFourUI.diaboloAcce,810,0);
    diaboloFourUI.imformation(diaboloFiveUI.diaboloAcce,1080,0);
  }
  catch(Exception e)
  {
    println("mine error : " + e.toString());
  }
}

void stop(){
  diaboloOneSound.close();
  diaboloTwoSound.close();
  diaboloThreeSound.close();
  diaboloFourSound.close();
  diaboloFiveSound.close();
  d1.stop();
  d2.stop();
  d3.stop();
  d4.stop();
  d5.stop();
  super.stop();
}