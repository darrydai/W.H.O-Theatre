void Send_acceX()
{
  OSCMessage msgOut("diabolo_One/acce");
  msgOut.add((int)acceX).add((int)acceY).add((int)acceZ);
  Udp.beginPacket(destIp, destPort);
  msgOut.send(Udp);
  Udp.endPacket();
  msgOut.empty();
  delay(100);
}

void Send_vector()
{
  OSCMessage msgOut("diabolo_One/vector");
  msgOut.add((float)vector_X).add((float)vector_Y).add((float)vector_Z);
  Udp.beginPacket(destIp, destPort);
  msgOut.send(Udp);
  Udp.endPacket();
  msgOut.empty();
  delay(100);
}


void Send_acceZero()
{
  OSCMessage msgOut("diabolo_One/acce");
  msgOut.add(0).add(0).add(0);
  Udp.beginPacket(destIp, destPort);
  msgOut.send(Udp);
  Udp.endPacket();
  msgOut.empty();
  delay(100);
}
