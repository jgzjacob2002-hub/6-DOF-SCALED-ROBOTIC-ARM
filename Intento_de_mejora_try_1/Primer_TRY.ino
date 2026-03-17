#include <Servo.h>

Servo s1, s2, s3, s4, s5, s6;

String buffer = "";

void setup() {
  Serial.begin(9600);

  s1.attach(5);
  s2.attach(6);
  s3.attach(11);
  s4.attach(8);
  s5.attach(9);
  s6.attach(10);
}

void loop() {
  while (Serial.available()) {
    char c = Serial.read();

    if (c == '\n') {
      int a1, a2, a3, a4, a5, a6;
      sscanf(buffer.c_str(), "%d,%d,%d,%d,%d,%d",
             &a1,&a2,&a3,&a4,&a5,&a6);

      s1.write(a1);
      s2.write(a2);
      s3.write(a3);
      s4.write(a4);
      s5.write(a5);
      s6.write(a6);

      buffer = "";
    }
    else {
      buffer += c;
    }
  }
}
