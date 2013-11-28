#include <Servo.h>

Servo myservo;
const int on_position=80;
const int neutral_position=90;
const int off_position=100;
const int max_time = 6000;
const int switch_delay=1;
const int motion=12;
const int servo=9;
const int serial=8;
int time = max_time;

void setup() {
  pinMode(motion, INPUT);
  digitalWrite(motion, HIGH);//Pullup
  pinMode(serial, OUTPUT);
  digitalWrite(serial, LOW);
  myservo.attach(servo);
}

void loop() {
  if (digitalRead(motion) == HIGH) {
    digitalWrite(serial, HIGH);
    if (time <=switch_delay) {
      myservo.write(on_position);
    }
    time = max_time;
  }
  if (time == max_time-switch_delay) {
    digitalWrite(serial, LOW);
    myservo.write(neutral_position);
  }
  if (time == switch_delay+1) {
    myservo.write(off_position);
  }
  if (time == 1) {
    myservo.write(neutral_position);
  }
  if (time !=0) {
    time--;
  }
  delay(100);
}
