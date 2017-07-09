// read Config
//
// ----------------------------------------------------------

import java.util.Properties;
import java.io.FileInputStream;

void readConfig() {

  Properties prop = new Properties();
  InputStream input = null;

  try {
    input = new FileInputStream(dataPath("config.ini"));

    // load a properties file
    prop.load(input);
    S3_2= prop.getProperty("3_2");
    S4_2 = prop.getProperty("4_2");
    S4_3 = prop.getProperty("4_3");
    switch ((int)sound)
    {
      case 1:
        soundOne = prop.getProperty("soundOne");
        soundTwo = prop.getProperty("soundTwo");
        soundThree = prop.getProperty("soundThree");
        soundFour = prop.getProperty("soundFour");
        soundFive = prop.getProperty("soundFive");
        break;
      case 2:
        soundOne = prop.getProperty("1_2");
        soundTwo = prop.getProperty("2_2");
        soundThree = prop.getProperty("3_2");
        soundFour = prop.getProperty("4_2");
        soundFive = prop.getProperty("soundFive");
        break;
      case 3:
        soundOne = prop.getProperty("1_3");
        soundTwo = prop.getProperty("2_3");
        soundThree = prop.getProperty("3_3");
        soundFour = prop.getProperty("4_3");
        soundFive = prop.getProperty("soundFive");
        break;
      case 4:
        soundOne = prop.getProperty("1_4");
        soundTwo = prop.getProperty("2_4");
        soundThree = prop.getProperty("3_4");
        soundFour = prop.getProperty("4_4");
        soundFive = prop.getProperty("soundFive");
        break;
      default:
        break;
    }    
  }
  catch(Exception e) {
    println("readConfig error catch: " + e.toString());
  }
}