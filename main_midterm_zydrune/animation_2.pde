// mouse Click pakeicia spalvas
color col1, col2;

ArrayList<Buble> bubles = new ArrayList<Buble>();
boolean coll = true;
class Buble {
  float size;
  boolean col;
}

void setup2() {
  for (float i = width*2; i > 0; i -= width/20) {
    Buble buble = new Buble();
    buble.size = i;
    buble.col = coll;
    coll = !coll;
    //println(coll);
    bubles.add(buble);
  }
}

void draw2() {
  pg3.beginDraw();
  pg3.fill(col1);
  float rectWidth = random(1, 100);
  float rectXPos = random(0, width);
  float rectYPos = random(0, height);
  println(rectXPos, rectYPos);
  pg3.noStroke();
  pg3.rect(rectXPos, rectYPos, 10, 10);
  pg3.endDraw();

  if (mouseClicks == 0) {
    col1 = colors[0];
    col2 = colors[1];
  } else if(mouseClicks == 1) {
    col1 = colors[1];
    col2 = colors[2];  
  } else if(mouseClicks == 2) {
    col1 = colors[2];
    col2 = colors[3];  
  } else if(mouseClicks == 3) {
  }
  noStroke();
  for(int i= bubles.size() - 1; i >= 0; i--) {
    Buble buble = bubles.get(i);
    Buble circleShow = bubles.get(bubles.size() - 1 - i);
     if(buble.col) {
       fill(col1);
     } else {
       fill(col2);
     }
    ellipse(width/2, height/2, circleShow.size, circleShow.size);
    buble.size += 2;
    
    
    if(buble.size > width*2) {
      Buble newCircle = new Buble();
      newCircle.size = 1;
      newCircle.col = coll;
      bubles.add(newCircle);
      bubles.remove(buble);
    }
    strokeWeight(50);
  }
    imageMode(CENTER);
    image(pg3, width/2, height/2);
}
