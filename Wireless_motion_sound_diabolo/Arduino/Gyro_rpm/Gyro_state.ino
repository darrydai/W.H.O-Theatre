void gyro_state()
{
  // Possible vector values can be:
  // - VECTOR_ACCELEROMETER - m/s^2
  // - VECTOR_MAGNETOMETER  - uT
  // - VECTOR_GYROSCOPE     - rad/s
  // - VECTOR_EULER         - degrees
  // - VECTOR_LINEARACCEL   - m/s^2
  // - VECTOR_GRAVITY       - m/s^2
  
  // EULER
  imu::Vector<3> euler = bno.getVector(Adafruit_BNO055::VECTOR_EULER);

  /* Display the floating point data */
  /*
  Serial.print("X: ");
  Serial.print(euler.x());
  Serial.print(" Y: ");
  Serial.print(euler.y());
  Serial.print(" Z: ");
  Serial.print(euler.z());
  Serial.print("\t\t");
  */
  Serial.print("euler: ");
  Serial.print(euler.x());
  Serial.print(" ");
  Serial.print(euler.y());
  Serial.print(" ");
  Serial.print(euler.z());
  Serial.println(" ");  
  //rotat_z=euler.z();
  // GYROSCOPE
  imu::Vector<3> gyroscope = bno.getVector(Adafruit_BNO055::VECTOR_GYROSCOPE);
  
  Serial.print("gyro: ");
  Serial.print(gyroscope.x());
  Serial.print(" ");
  Serial.print(gyroscope.y());
  Serial.print(" ");
  Serial.print(gyroscope.z());
  Serial.println(" ");
  rpm=abs(gyroscope.z())*(60/(2*3.14159));
  Serial.print("RPM=");
  Serial.println(rpm);
  // ACCELEROMETER
  /*imu::Vector<3> accelerometer = bno.getVector(Adafruit_BNO055::VECTOR_ACCELEROMETER);
  
  Serial.print("acc: ");
  Serial.print(accelerometer.x());
  Serial.print(" ");
  Serial.print(accelerometer.y());
  Serial.print(" ");
  Serial.print(accelerometer.z());
  Serial.println(" ");*/
  
  /*
  // Quaternion data
  imu::Quaternion quat = bno.getQuat();
  Serial.print("qW: ");
  Serial.print(quat.w(), 4);
  Serial.print(" qX: ");
  Serial.print(quat.y(), 4);
  Serial.print(" qY: ");
  Serial.print(quat.x(), 4);
  Serial.print(" qZ: ");
  Serial.print(quat.z(), 4);
  Serial.print("\t\t");
  */

  /* Display calibration status for each sensor. */
  uint8_t system, gyro, accel, mag = 0;
  bno.getCalibration(&system, &gyro, &accel, &mag);
  //Serial.print("CALIBRATION: Sys=");
  Serial.print("CAL: Sys=");
  Serial.print(system, DEC);
  Serial.print(" Gyro=");
  Serial.print(gyro, DEC);
  Serial.print(" Accel=");
  Serial.print(accel, DEC);
  Serial.print(" Mag=");
  Serial.println(mag, DEC);

  delay(BNO055_SAMPLERATE_DELAY_MS);
}

