int previousDisplayTime;  // Keep track of the last time a frame of the animation was displayed
int deltaTime;            // The time between each frame
boolean init = true;
// btn
//BTN btn1;

// text
PFont info;
String message[] = {"Welcome!", "Press x to begin.", "MOUSE CLICK controls animation", "SPACE changes it.", ""};
char[] charArray0 = message[0].toCharArray();
char[] charArray1 =message[1].toCharArray();
char[] charArray2 =message[2].toCharArray();
char[] charArray3 =message[3].toCharArray();
char[] charArray4 =message[4].toCharArray();
color textColor;

int line = 0;
int x;
int y = 0;
//PGraphics pgAnimation0;

void setup0() {
  if(mousePressed) {
  pg2.beginDraw();
  posX = posX + speedX;
  posY = posY + speedY;

  if (posX > width) {
    speedX = speedX* -1;
  }

  if (posX < 0) {
    speedX = speedX* -1;
  }

  if (posY > height) {
    speedY= speedY* -1;
  }
  
  if (posY < 0) {
    speedY= speedY*-1;
  }
  pg2.fill(255, 0, 0);
  pg2.ellipse(posX, posY, 50, 50);
  pg2.endDraw();
  // MAYBE
  imageMode(CENTER);
  image(pg2, width/2, height/2);
  }
  background(0);
deltaTime = 500; // Display every seconds
  previousDisplayTime = 0;
  
  info = loadFont("Gotham-Black-70.vlw");
  textFont(info, 20);
  
  //pgAnimation0 = createGraphics(width, height);
  //btn
  //btn1 = new BTN(width/2, height/2, 20, 20);
}

void draw0() {

  //pgAnimation0.beginDraw();
  if (millis() > previousDisplayTime) {
    textFont(info);
    background(0);
   line = 200;
    for(int i = 0; i < message.length; i++) {
      x = 100;

      for(int j = 0; j <message[i].length(); j++) {
        if(!(init)) {
          fill(randColor());
        } else {
          fill(colors[2]);
        }
        text(message[i].charAt(j), x, line);
        x+= textWidth(message[i].charAt(j));
    }
      line += 80;
      
      previousDisplayTime = millis() + deltaTime;
    }
  }
}

//class BTN {
//  int w, h;
//  int xPos, yPos;
//  float activeX1;
//  float activeY1;
//  float activeMouseZone[] = new float[4];
//  boolean btnClicked = false;
  
//  BTN(int xPos, int yPos, int w, int h) {
//    this.w = w;
//    this.h = h;
//    this.xPos = xPos;
//    this.yPos = yPos;
//    activeZone();
//  }
  
//  void display() {
//    rectMode(CENTER);
//    stroke(255);
//    rect(xPos, yPos, w, h);
//  }
  
//  // returns an array of active zone(x1, y1, x2, y2)
//  void activeZone() {
//    activeMouseZone[0] = xPos - w/2;
//    activeMouseZone[1] = yPos - h/2;
//    activeMouseZone[2] = xPos + w/2;
//    activeMouseZone[3] = yPos + h/2;
//  }
  
//  boolean btnActive() {
//    if(mouseX >= activeMouseZone[0] && mouseX <= activeMouseZone[2] &&
//       mouseY >= activeMouseZone[1] && mouseY < activeMouseZone[3]) {
//         return true;
//       }
//    else return false;
//  }
  
//  void mouseClicked() {
//    if (btnActive() && mousePressed == true) {

//    } else {
//      //fill(255, 0, 0);
//    }
//  }
//}
