float xPos, yPos, xStart, yStart;
int sign, signH, signH2, xFin;
boolean showPG = false;
// Timing
int prevDisplay4;
int deltaTime4;


void setup4() {
  background(0);
  kampas = 0;
  xStart = 1;
  xFin = width;
  deltaTime4 = 100;
  prevDisplay4 = 0;
  sign = 1;
  signH = 1;
  signH2 = -1;
  pg = createGraphics(width, height);
}

void draw4() {

  if(millis() > prevDisplay4) {
    if (!(noBackground)) {
      background(0);
    }
    randomLines();
    horizontalLines();
    horizontalLines2();
    verticalLines();
    prevDisplay4 = millis() + deltaTime4;
  }
  
}
void randomLines() {
    float d = map(mouseX, 0, width, 0, 3);
    int v = (int)Math.floor(d);
    if(v < 0) v = 0;
    if(v > colors.length) v = colors.length - 1;
    //stroke(colors[v]);
    stroke(248, 247, 249);
    strokeWeight(random(0, 30));
    //strokeWeight(random(1, 10));
    if (horizontalDirection() == false) {
      line(mouseX, 0, mouseX, height);
    } else {
      line(0, mouseY, width, mouseY);    
    }
}

boolean horizontalDirection() {
  float randN = (int)Math.floor(random(0, 2));
  if(randN == 0) {
    return true;
  } else return false;
}

void horizontalLines() {
  //println(colors.length);
  // d and v variables determine the color of a stroke depending on the line's position on screen
    float d = map(xStart, 0, width, 0, colors.length - 1);
    int v = (int)Math.floor(d);
    if(v < 0) v = 0;
    if(v >= colors.length) v = colors.length - 1;
    stroke(colors[v]);
    strokeWeight(random(1, 10));
    line(xStart, 0, xStart, height);
    xStart += random(3,30) * signH;
    
    // change sign if line reaches bounds of canvas
    if( xStart > width ) {
      //println("now");
      signH = -1;
    } 
    if(xStart < 0) {
      // -1 * -1
      signH *= signH;   
    }
}

void horizontalLines2() {
  println(colors.length);
  // d and v variables determine the color of a stroke depending on the line's position on screen
    float d = map(xFin, 0, width, 0, colors.length - 1);
    int v = (int)Math.floor(d);
    if(v < 0) v = 0;
    if(v > colors.length) v = colors.length - 1;
    stroke(colors[v]);
    strokeWeight(random(1, 10));
    line(xFin, 0, xFin, height);
    xFin += random(3,30) * signH2;
    
    // change sign if line reaches bounds of canvas
    if( xStart > width ) {
      //println("now");
      signH *= signH;   
    } 
    if(xStart < 0) {
      // -1 * -1
      signH = -1;   
    }
}

void verticalLines() {
    float d = map(yStart, 0, height, colors.length - 1, 0);
    int v = (int)Math.floor(d);
    if(v < 0) v = 0;
    if(v > colors.length) v = colors.length - 1;
    stroke(colors[v]);
    strokeWeight(random(1, 10));
    line(0, yStart, width, yStart);
    yStart += random(3, 30) * sign;
    if( yStart > height ) {
      //println("now");
      sign = -1;
    } 
    if(yStart < 0) {
      // -1 * -1
      sign *= sign;   
    }    
}
