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
    
    soundOne = prop.getProperty("soundOne");
    soundTwo = prop.getProperty("soundTwo");
    soundThree = prop.getProperty("soundThree");
    soundFour = prop.getProperty("soundFour");
    soundFive = prop.getProperty("soundFive");
    
  }
  catch(Exception e) {
    println("readConfig error catch: " + e.toString());
  }
}