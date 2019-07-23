import com.hamoid.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

VideoExport videoExport;

float movieFPS = 20;
float soundDuration = 120.00;

//https://happycoding.io/tutorials/processing/creating-classes
// ellipse(xPos, yPos, width, height);

// Creates an array that holds color codes
color fresh = color(74, 188, 173);
color vermillion = color(255, 73, 29);
color sunshine = color(248, 183, 50);
color clean = color(224, 220, 228);
color colors[] = {fresh, vermillion, sunshine, clean};

// pradeda nuo horizantaliai judanciu apskritimu
//boolean mouseClick = false;
int mouseClicks = 0;
boolean animation_active0 = true;
boolean animation_active1 = false;
boolean animation_active2 = false;
boolean animation_active3 = false;
boolean animation_active4 = false;
boolean backgroundIsClean = false;
boolean noBackground = false;
PGraphics pg, pg2, pg3;

Minim minim;
AudioPlayer player;
AudioPlayer player2;

void setup() {
  
  videoExport = new VideoExport(this);
  videoExport.setFrameRate(movieFPS);
  videoExport.setAudioFileName("Ambient.mp3");
  videoExport.startMovie();  
  
  noCursor();
  minim = new Minim(this);
  //player2 = minim.loadFile("Ambient.mp3");
  player2 = minim.loadFile("Ulver - Rolling Stone.mp3");  
  background(0);
  
  pg = createGraphics(width, height);
  pg2 = createGraphics(width, height);  
  pg3 = createGraphics(width, height);
  
  count = 0; 
  fullScreen();

  setup0();
   setup1();
  // animation_1
  for(int i = 0; i<circles.length; i++) {
    circles[i] = new Circle(random(width), random(height), random(-3, 3), random(-3, 3));
  }

  setup2();
  setup3();
  setup4();
  
}

int posX = 0;
int posY = 0;
int speedY= 5;
int speedX = 2;


void showPg1() {
  imageMode(CENTER);
  image(pg, width/2, height/2);
}

void draw() {

    pg.beginDraw();
    pg.fill(colors[(int)random(0,3)]);
    pg.noStroke();
    float randWidth = random(0, 10);
    pg.ellipse(mouseX, mouseY, randWidth, randWidth);
    pg.endDraw();
  
  if((animation_active0 && mousePressed) || key=='x') showPg1();
  
  if(animation_active0) {
      println("active animation : 0");
      draw0();
  } else if(animation_active1) {
    if(mousePressed && key =='5') {
      background(0);
    }

    for(int i = 0; i<circles.length; i++) {
      circles[i].move();
      circles[i].display();
    }
  } else if (animation_active2) {
    draw2();
  } else if(animation_active3) {
    draw3();
  } else if(animation_active4) {
    draw4();
  }
  
  videoExport.saveFrame();
}

void keyPressed() {
  if(animation_active0 && key == 'x') {
    init = false;
    player2.play();}
    
  if (key == ' ' && animation_active0) {
    mouseClicks = 0;
    animation_active0 = false;
    animation_active1 = true;
  } else if (key == ' ' && animation_active1) {
    mouseClicks = 0;
    animation_active1 = false;
    animation_active2 = true;
  } else if (key == ' ' && animation_active2) {
    mouseClicks = 0;
    animation_active2 = false;
    animation_active3 = true;
  } else if (key == ' ' && animation_active3) {
    mouseClicks = 0;
    animation_active3 = false;
    animation_active4 = true;
    background(0);
  } else if (key == ' ' && animation_active4) {
    mouseClicks = 0;
    animation_active4 = false;
    animation_active2 = true;
  }
  if (key == '1') {
    animation_active0 = true;
    animation_active1 = false;
    animation_active2 = false;
    animation_active3 = false;
  }
  if (key == '2') {
    animation_active0 = false;
    animation_active1 = true;
    animation_active2 = false;
    animation_active3 = false;
  }
  if (key == '3') {
    animation_active0 = false;
    animation_active1 = false;
    animation_active2 = true;
    animation_active3 = false;
  }
  if (key == '4') {
    animation_active0 = false;
    animation_active1 = false;
    animation_active2 = false;
    animation_active3 = true;
    // ketvirtas pridetas
    animation_active4 = false;
  }
  if (key == '5') {
    noBackground = false;
    animation_active0 = false;
    animation_active1 = false;
    animation_active2 = false;
    animation_active3 = false;
    animation_active4 = true;
  }
  if(key == '6') {
    pg.beginDraw();
    pg.fill(colors[(int)random(0,3)]);
    pg.noStroke();
    float randWidth = random(0, 10);
    pg.ellipse(mouseX, mouseY, randWidth, randWidth);
    pg.endDraw();
    imageMode(CENTER);
    image(pg, width/2, height/2);  
  }
  if(key == '7') {
    noBackground = true;
    animation_active0 = false;
    animation_active1 = false;
    animation_active2 = false;
    animation_active3 = false;
    animation_active4 = true;
  }
  if(key == 's') {
    saveFrame("midterm-###.png");
  }
}
  

// counts mouse clicks. Maximum is 3
void mousePressed() {
  if(animation_active0) {
    mouseClicks++;
    if (mouseClicks == 3) mouseClicks = 0;
  }
  if(animation_active1) {
    mouseClicks++;
    if (mouseClicks == 2) mouseClicks = 0;
  }
  if(animation_active2) {
    mouseClicks++;
    if (mouseClicks == 3) mouseClicks = 0;
  }
  if(animation_active3) {
    mouseClicks++;
    if (mouseClicks == 3) mouseClicks = 0;
  }
}

color randColor() {
 return colors[parseInt(random(0,3))];
}

// kazkada grazinamas i false
void cleanTheBackground() {
  if (!(backgroundIsClean)) {
    background(0);
  }
  backgroundIsClean = true;
}
