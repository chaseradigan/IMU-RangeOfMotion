import processing.serial.*;
//---CONNECTION---
Serial myPort;
Serial myPort2;// Create object from Serial class
int lf = 10;    // Linefeed in ASCII
String lowerarmString = null;
String upperarmString = null;
float lowerarmnum;
float upperarmnum;
//---DRAWING---
float y = 500 ;
float x = 500 ;
float upperarmAngle;
float m1;
float lowerarmAngle;
float angle;
float m2;
float r = 200;
float c;
float s;
float c2;
float s2;
float x2;
float y2;
float x3;
float y3;
float ynew;
void setup()
{
  // set up the ports for each arduino
  String portName = Serial.list()[1]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 115200);
  myPort.clear();
  
  String portName2 = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort2 = new Serial(this, portName2, 115200);
  myPort2.clear();
  
  size(1000, 1000);
  frameRate(30);
}
void draw() {
  background(204);
  // read in arduino data and store it as a lowerarmnum or upperarmnum depending on the arduino position
  while (myPort.available() > 0 && myPort2.available() > 0 ) {
    lowerarmString = myPort.readStringUntil(lf);
    upperarmString = myPort2.readStringUntil(lf);
  if (lowerarmString != null && upperarmString != null) {
  lowerarmnum=float(lowerarmString);  // Converts and prints float
  upperarmnum=float(upperarmString);}
  //-----DRAWING-----
  // draw the lines to represent the lower arm and upper arm intersecting at the elbow
  upperarmAngle=radians(upperarmnum);
  m1 = tan(upperarmAngle);
  c = 1/sqrt((1+sq(m1)));
  s = m1/sqrt((1+sq(m1)));
  x2 = x - r*c;
  y2 = y - r*s;
  line(x, y, x2, y2);
  lowerarmAngle=radians(lowerarmnum);
  m2 = tan(lowerarmAngle);
  c2 = 1/(sqrt(1+sq(m2)));
  s2 = m2/(sqrt(1+sq(m2)));
  x3 = x2 - r*c2;
  y3 = y2 - r*s2;
  line(x2, y2, x3, y3);
  //angle = -(atan(m1)+atan(m2))*180/PI;
  angle = atan((m1-m2)/(1+m1*m2)) * 180/PI;
  print(angle);
  print(" ");
 // upperarmAngle = upperarmAngle + 0.001;
 // lowerarmAngle = lowerarmAngle + 0.01;
  print(upperarmAngle*180/PI);
  print(" ");
  println(lowerarmAngle*180/PI);
    
  }
  myPort.clear();
} 
