void check_Device()
{
  if(device_Status != device_lastStatus)
  {
    diaboloThreeUI.ConnectStatus(true);
  }
  else
  {
    diaboloThreeUI.ConnectStatus(false);
  }
  device_lastStatus=device_Status;
}

void ran_Sound()
{
  time=millis()/1000;
  println(time);
  //check_time=time;
  //if((time-check_time)==10)
  //{
  //  sound= random(1,4);
  //  print(sound);
  //  readConfig();
  //  diaboloOneSound.pause();
  //  diaboloTwoSound.pause();
  //  diaboloThreeSound.pause();
  //  diaboloFourSound.pause();
  //  diaboloOneSound = d1.loadFile(soundOne);
  //  diaboloTwoSound = d1.loadFile(soundTwo);
  //  diaboloThreeSound = d3.loadFile(soundThree);
  //  diaboloFourSound = d4.loadFile(soundFour);
  //  check_time=time;
  //}
  println(check_time);
  if((time-check_time)==45)
  {
    diaboloThreeSound.pause();
    delay(500);
    diaboloThreeSound = d3.loadFile(S3_2);
  }
  if((time-check_time)==69)
  {
    diaboloFourSound.pause();
    diaboloFourSound = d4.loadFile(S4_2);
  }
  if((time-check_time)==149)
  {
    diaboloFourSound.pause();
    diaboloFourSound = d4.loadFile(S4_3);
  }
}