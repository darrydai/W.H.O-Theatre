/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) 
{
  if(theOscMessage.addrPattern().equals("/diabolo_One"))
  {
    diaboloOneUI.ConnectStatus(true);
    for(int count=0;count<3;count++)
    {
      diaboloOneAcce[count]=theOscMessage.get(count).intValue();
    }
  }
  else if(theOscMessage.addrPattern().equals("/diabolo_Two"))
  {
    diaboloTwoUI.ConnectStatus(true);
    for(int count=0;count<3;count++)
    {
      diaboloTwoAcce[count]=theOscMessage.get(count).intValue();
    } 
  }
  else if(theOscMessage.addrPattern().equals("/diabolo_Three"))
  {
    diaboloThreeUI.ConnectStatus(true);
    for(int count=0;count<3;count++)
    {
      diaboloThreeAcce[count]=theOscMessage.get(count).intValue();
    } 
  }
  else if(theOscMessage.addrPattern().equals("/diabolo_Four"))
  {
    diaboloFourUI.ConnectStatus(true);
    for(int count=0;count<3;count++)
    {
      diaboloFourAcce[count]=theOscMessage.get(count).intValue();
    } 
  }
  else if(theOscMessage.addrPattern().equals("/diabolo_Five"))
  {
    diaboloFourUI.ConnectStatus(true);
    for(int count=0;count<3;count++)
    {
      diaboloFourAcce[count]=theOscMessage.get(count).intValue();
    } 
  }
  else
  {
    diaboloOneConnectStatus = false;
    diaboloTwoConnectStatus = false;
    diaboloThreeConnectStatus = false;
    diaboloFourConnectStatus = false;
  }
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  println(" diabolo_One_Acce: "+diaboloOneAcce[0]+","+diaboloOneAcce[1]+","+diaboloOneAcce[2]);
  println(" diabolo_Two_Acce: "+diaboloTwoAcce[0]+","+diaboloTwoAcce[1]+","+diaboloTwoAcce[2]);
}