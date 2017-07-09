void keyPressed()
{ 
  switch( key )
  {
    case 'r':
      diaboloOneSound.cue(0);
      diaboloOneSound.pause();
      diaboloTwoSound.cue(0);
      diaboloTwoSound.pause();
      diaboloThreeSound.cue(0);
      diaboloSound3_2.cue(0);
      diaboloSound3_2.pause();
      diaboloFourSound.cue(0);
      diaboloSound4_2.cue(0);
      diaboloSound4_3.cue(0);
      diaboloSound4_2.pause();
      diaboloSound4_3.pause();
      break;
     case '1':
       if( diaboloOneSound.position() == diaboloOneSound.length() )
       {
         diaboloOneSound.rewind();
       }
       diaboloOneSound.play();
       break;
     case '2':
       if( diaboloTwoSound.position() == diaboloTwoSound.length() )
       {
         diaboloTwoSound.rewind();
       }
       diaboloTwoSound.play();
       break;
     case '3':
       if( diaboloThreeSound.position() == diaboloThreeSound.length() )
       {
         diaboloThreeSound.pause();
         diaboloSound3_2.play();
         if( diaboloSound3_2.position() == diaboloSound3_2.length() )
         {
           diaboloSound3_2.rewind();
         }
       }
       diaboloThreeSound.play();
       break;
     case '4':
       if( diaboloFourSound.position() == diaboloFourSound.length() )
       {
         diaboloFourSound.pause();
         diaboloSound4_2.play();
         if( diaboloSound4_2.position() == diaboloSound4_2.length() )
         {
           diaboloSound4_2.pause();
           diaboloSound4_3.play();
           if( diaboloSound4_3.position() == diaboloSound4_3.length() )
           {
             diaboloSound4_3.rewind();
           }
         }
       }
       diaboloFourSound.play();
       break;
    default: break;  
  }
}