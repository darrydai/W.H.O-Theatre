void Send_acceX()
{
  OSCMessage msgOut("/diabolo_One");
  msgOut.add(acceX).add(acceY).add(acceZ);
  Udp.beginPacket(destIp, destPort);
  msgOut.send(Udp);
  Udp.endPacket();
  msgOut.empty();
  delay(100);
}

void Send_acceY()
{
  OSCMessage msgOut("/diabolo_One");
  msgOut.set(1,acceY);
  Udp.beginPacket(destIp, destPort);
  msgOut.send(Udp);
  Udp.endPacket();
  msgOut.empty();
  delay(100);
}

void Send_acceZ()
{
  OSCMessage msgOut("/diabolo_One");
  msgOut.set(2,acceZ);
  Udp.beginPacket(destIp, destPort);
  msgOut.send(Udp);
  Udp.endPacket();
  msgOut.empty();
  delay(100);
}

void Send_zero()
{
  OSCMessage msgOut("/diabolo_One");
  msgOut.add(0).add(0).add(0);
  Udp.beginPacket(destIp, destPort);
  msgOut.send(Udp);
  Udp.endPacket();
  msgOut.empty();
  delay(100);
}
