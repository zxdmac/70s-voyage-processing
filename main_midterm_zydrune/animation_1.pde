// Creating an array that holds class instances
Circle[] circles = new Circle[200];
int count;

float circleSize;
float sizeIncrement = 1;
Circle c1, c2, c3;
float opacity;

void setup1() {
  background(0);
}

class Circle {
  // ellipse(xPos, yPos, width, height);
  // class-level variables:
  float x, y, xIncrement, yIncrement, circleSize;
  color spl;
  
  Circle(float xPos, float yPos, float xIncr, float yIncr) {
    this.x = xPos;
    this.y = yPos;
    this.xIncrement = xIncr;
    this.yIncrement = yIncr;
    circleSize = random(1, 130);
    spl= colors[parseInt(random(0,3))];
    opacity = random(0,255);
  }
  
  void move() {
    //println(mouseClicks);
    if (mouseClicks == 0) {
      // move horizontaly
      x += xIncrement;
    }
    else if (mouseClicks == 1) {
      // move verticaly
      y += yIncrement;
    }
    else if (mouseClicks == 2){
      x += xIncrement;
      y+= yIncrement;
    } 
  
    if(x > width-1 || x < 1 ) xIncrement *= -1;
    if(y > height -1 || y < 1 ) yIncrement *= -1; 
  }
  
  void display() {
    count++;
    //if (mouseClicks == 0 || mouseClicks == 1) {
    //  noStroke();
    //  fill(spl, 175);
    //} else if (mouseClicks == 2) {
    //  cleanTheBackground();
      fill(spl);
      noStroke();
    //}
    ellipse(x, y, circleSize, circleSize);
  }
}
