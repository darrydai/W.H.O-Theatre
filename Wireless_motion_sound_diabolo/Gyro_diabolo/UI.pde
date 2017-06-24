final class UI
{
  String PlayStatus="stop";
  int soundTrack;
  boolean diaboloConnectStatus = false;
  
  int diaboloAcce[]={0,0,0};
  float diaboloOrientation[]={0,0,0};
  
  float motionTransforGain;
  
  boolean ConnectStatus(boolean Status)
  {
    diaboloConnectStatus = Status;
    return diaboloConnectStatus;
  }
  
  final void drawTheCircle(int shift_x,int shift_y,int w,int h)
  {
    try
    {
      noFill();
      strokeWeight(2);
      if(diaboloConnectStatus ==false)
      {
        stroke(156,156,156);
      }
      else
      {
        stroke(204, 102, 0);
      }
      ellipse(shift_x, shift_y, w, h);
    }
    catch(Exception e)
    {
      println("draw AnalyzeSound error : " + e.toString());
    } 
  }
  
  //visullilation soud wave
  final void AnalyzeSound(int shift_x,int shift_y,int select)
  {
    try
    {
      soundTrack=select;
      strokeWeight(1);
      stroke(204, 102, 0);
      pushMatrix();
      translate(shift_x, shift_y);
      switch (soundTrack)
      {
        case 1:
          for(int i = 0; i < diaboloOneSound.bufferSize() - 1; i++)
          {
            float x1 = map( i, 0, diaboloOneSound.bufferSize(), 0, 150 );
            float x2 = map( i+1, 0, diaboloOneSound.bufferSize(), 0, 150 );
            line( x1, 133 + diaboloOneSound.mix.get(i)*30, x2, 133 + diaboloOneSound.mix.get(i+1)*30 );
          }
          break;
        case 2:
          for(int i = 0; i < diaboloTwoSound.bufferSize() - 1; i++)
          {
            float x1 = map( i, 0, diaboloTwoSound.bufferSize(), 0, 150 );
            float x2 = map( i+1, 0, diaboloTwoSound.bufferSize(), 0, 150 );
            line( x1, 133 + diaboloTwoSound.mix.get(i)*30, x2, 133 + diaboloTwoSound.mix.get(i+1)*30 );
          }
          break;
        case 3:
          for(int i = 0; i < diaboloThreeSound.bufferSize() - 1; i++)
          {
            float x1 = map( i, 0, diaboloThreeSound.bufferSize(), 0, 150 );
            float x2 = map( i+1, 0, diaboloThreeSound.bufferSize(), 0, 150 );
            line( x1, 133 + diaboloThreeSound.mix.get(i)*30, x2, 133 + diaboloThreeSound.mix.get(i+1)*30 );
          }
          break;
        case 4:
          for(int i = 0; i < diaboloFourSound.bufferSize() - 1; i++)
          {
            float x1 = map( i, 0, diaboloFourSound.bufferSize(), 0, 150 );
            float x2 = map( i+1, 0, diaboloFourSound.bufferSize(), 0, 150 );
            line( x1, 133 + diaboloFourSound.mix.get(i)*30, x2, 133 + diaboloFourSound.mix.get(i+1)*30 );
          }
          break;
        case 5:
          for(int i = 0; i < diaboloFiveSound.bufferSize() - 1; i++)
          {
            float x1 = map( i, 0, diaboloFiveSound.bufferSize(), 0, 150 );
            float x2 = map( i+1, 0, diaboloFiveSound.bufferSize(), 0, 150 );
            line( x1, 133 + diaboloFiveSound.mix.get(i)*30, x2, 133 + diaboloFiveSound.mix.get(i+1)*30 );
          }
          break;
         default:
          break;
      }
      popMatrix();
    }
    catch (Exception e)
    {
      println("draw AnalyzeSound error : " + e.toString());
    }
  }
  
  //show the imformation on sketch
  final void imformation(int acce[],int shift_x,int shift_y)
  {
    try 
    {
      pushMatrix();
      translate(shift_x,shift_y);
      //textFont(font, 18);
      textSize(18);
      if(diaboloConnectStatus == false)
      {
        fill(156,156,156);
      }
      else
      {
        fill(204, 102, 0);
      }
      text("Status --- ", 60, 249.941);
      text(PlayStatus, 160,250);
      text("AcceX --- ", 61.4, 281);
      text(acce[0], 160,281);
      text("AcceY --- ", 61.4, 313);
      text(acce[1], 160,313);
      text("AcceZ --- ", 61.4, 342);
      text(acce[2], 160,342);
      popMatrix();
    }
    catch (Exception e)
    {
      println("draw imformation error : " + e.toString());
    }
  }
  
  final void checkAndPlayFile(int sensorAcceVal,int selectDiabolo)//int sensorVal)
  {
    soundTrack=selectDiabolo;
    try 
    {
      switch (soundTrack)
      {
        case 1:
          //acce_X value < -15,play the sound file
          if(sensorAcceVal<(-9))
          {
            //if sound is end,replay the sound file
            if( diaboloOneSound.position() == diaboloOneSound.length() )
            {
              diaboloOneSound.rewind();
            }
            diaboloOneSound.play();
            PlayStatus = "play";
          }
          else if(diaboloOneSound.isPlaying())
          {
            diaboloOneSound.pause();
            PlayStatus = "stop";
          }
          break;
       case 2:
          if(sensorAcceVal<(-12))
          {
            if( diaboloTwoSound.position() == diaboloTwoSound.length() )
            {
              diaboloTwoSound.rewind();
              //diaboloTwoSound.play();
            }
            diaboloTwoSound.play();
            PlayStatus = "play";
          }
          else if(diaboloTwoSound.isPlaying())
          {
            diaboloTwoSound.pause();
            PlayStatus = "stop";
          }
          break;
         case 3:
          if(sensorAcceVal>15)
          {
            diaboloThreeSound.play();
            if( diaboloThreeSound.position() == diaboloThreeSound.length() )
            {
              diaboloThreeSound.rewind();
            }
            PlayStatus = "play";
          }
          else if(diaboloThreeSound.isPlaying())
          {
            diaboloThreeSound.pause();
            PlayStatus = "stop";
          }
          break;
         case 4:
          if(sensorAcceVal>15)
          {
            diaboloFourSound.play();
            if( diaboloFourSound.position() == diaboloFourSound.length() )
            {
              diaboloFourSound.rewind();
            }
            PlayStatus = "play";
          }
          else if(diaboloFourSound.isPlaying())
          {
            diaboloFourSound.pause();
            PlayStatus = "stop";
          }
          break;
         case 5:
          if(sensorAcceVal>15)
          {
            diaboloFiveSound.play();
            if( diaboloFiveSound.position() == diaboloFiveSound.length() )
            {
              diaboloFiveSound.rewind();
            }
            PlayStatus = "play";
          }
          else if(diaboloFiveSound.isPlaying())
          {
            diaboloFiveSound.pause();
            PlayStatus = "stop";
          }
          break;
         default:
          break;
      }
    }
    catch(Exception e)
    {
      println("checkAndPlayFile error : " + e.toString());
    }
  }
  
  void montion_Transfor(float diaboloOrientation[])
  {
    motionTransforGain=map(diaboloOrientation[0],0,360,-60,0);
    print("X="+diaboloOrientation[0]);
    println("Gain="+motionTransforGain);
  }
}