/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) 
{
  try{
    if(theOscMessage.addrPattern().equals("diabolo_One/acce"))
    {
      diaboloOneUI.ConnectStatus(true);
      for(int count=0;count<3;count++)
      {
        diaboloOneUI.diaboloAcce[count]=theOscMessage.get(count).intValue();
      }
    }
    else if(theOscMessage.addrPattern().equals("diabolo_One/vector"))
    {
      //diaboloOneUI.ConnectStatus(true);
      for(int count=0;count<3;count++)
      {
        diaboloOneUI.diaboloOrientation[count]=theOscMessage.get(count).floatValue();
      } 
    }
    else if(theOscMessage.addrPattern().equals("diabolo_Two/acce"))
    {
      diaboloTwoUI.ConnectStatus(true);
      for(int count=0;count<3;count++)
      {
        diaboloTwoUI.diaboloAcce[count]=theOscMessage.get(count).intValue();
      } 
    }
    else if(theOscMessage.addrPattern().equals("diabolo_Two/vector"))
    {
      //diaboloOneUI.ConnectStatus(true);
      for(int count=0;count<3;count++)
      {
        diaboloTwoUI.diaboloOrientation[count]=theOscMessage.get(count).floatValue();
      } 
    }
    else if(theOscMessage.addrPattern().equals("diabolo_Three/acce"))
    {
      diaboloThreeUI.ConnectStatus(true);
      for(int count=0;count<3;count++)
      {
        diaboloThreeUI.diaboloAcce[count]=theOscMessage.get(count).intValue();
      }
      device_Status++;
      if(device_Status==2)
      {
        device_Status=0;
      }
    }
    else if(theOscMessage.addrPattern().equals("diabolo_Four/acce"))
    {
      diaboloFourUI.ConnectStatus(true);
      for(int count=0;count<3;count++)
      {
        diaboloFourUI.diaboloAcce[count]=theOscMessage.get(count).intValue();
      } 
    }
    else if(theOscMessage.addrPattern().equals("diabolo_Five/acce"))
    {
      diaboloFiveUI.ConnectStatus(true);
      for(int count=0;count<3;count++)
      {
        diaboloFiveUI.diaboloAcce[count]=theOscMessage.get(count).intValue();
      } 
    }
    else if(theOscMessage.addrPattern().equals("diabolo_Five/vector"))
    {
      //diaboloOneUI.ConnectStatus(true);
      for(int count=0;count<3;count++)
      {
        diaboloFiveUI.diaboloOrientation[count]=theOscMessage.get(count).floatValue();
      } 
    }
    else
    {
      //diaboloOneUI.ConnectStatus(false);
      //diaboloTwoUI.ConnectStatus(false);
      //diaboloThreeUI.ConnectStatus(false);
      //diaboloFourUI.ConnectStatus(false);
      //diaboloFiveUI.ConnectStatus(false);
    }
    /* print the address pattern and the typetag of the received OscMessage */
    //print("### received an osc message.");
    //print(" addrpattern: "+theOscMessage.addrPattern());
    //println(" typetag: "+theOscMessage.typetag());
    //println(" diabolo_One_Acce: "+diaboloOneUI.diaboloAcce[0]+","+diaboloOneUI.diaboloAcce[1]+","+diaboloOneUI.diaboloAcce[2]);
    //println(" diabolo_Two_Acce: "+diaboloTwoUI.diaboloAcce[0]+","+diaboloTwoUI.diaboloAcce[1]+","+diaboloTwoUI.diaboloAcce[2]);
    //println(" diabolo_Three_Acce: "+diaboloThreeUI.diaboloAcce[0]+","+diaboloThreeUI.diaboloAcce[1]+","+diaboloThreeUI.diaboloAcce[2]);
    //println(" diabolo_Four_Acce: "+diaboloFourUI.diaboloAcce[0]+","+diaboloFourUI.diaboloAcce[1]+","+diaboloFourUI.diaboloAcce[2]);
    //println(" diabolo_Five_Acce: "+diaboloFiveUI.diaboloAcce[0]+","+diaboloFiveUI.diaboloAcce[1]+","+diaboloFiveUI.diaboloAcce[2]);
  }
  catch(ArithmeticException ex)
  {
    println("oscEvent error : " + ex.toString());
  }
}