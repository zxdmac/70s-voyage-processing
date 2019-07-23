PImage img, img2, img3, img4;
PGraphics animation3;

int kampas = 0;
int prevDisplay3;
int deltaTime3;
boolean smile = false;
void setup3() {
  img = loadImage("smile-1.png");
  img2 = loadImage("smile-2.png");
  img3 = loadImage("smile-3.png");
  img4 = loadImage("smile-4.png");
  animation3 = createGraphics(width, height);
  deltaTime3 = 30;
  prevDisplay3 = 0;
}

void draw3() {
  //smooth(8);
  if(mouseClicks != 2) {
    background(248, 183, 50);
  }
  imageMode(CENTER);
  image(img, width/2, height/2);
  pushMatrix();
  translate(width/2, height/2+60);
  if(mouseClicks == 0) {
    image(img2, 0, 0);
  }
  if(mouseClicks == 1) {
    rotate(radians(kampas));
    if(kampas < 180) {
    kampas+= 10;
    }
    image(img2, 0, 0);
}
  popMatrix();

  
  if(mouseClicks == 2) {
    //player2.play();
    if (millis() > prevDisplay3 + deltaTime3) {
      background(0, 170);
      image(img, width/2, height/2);
      image(img3, width/2, height/2);
      image(img3, random(0, width), random(0, height), 100, 100);
      prevDisplay3 = millis();
      deltaTime += 100;
    }
  }
}
