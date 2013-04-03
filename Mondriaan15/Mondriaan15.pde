/*
De enige echte VICTORY boogie woogie. 
 Ben met het concept begonnen om met digitale confetti te werken. 
 Waarom? Omdat het een overwinning is. 
 */

Plane plane;
ArrayList planeList;
int plane_x, plane_y;
int timer, cap;

void setup() {
  planeList = new ArrayList();
  size(550, 480);
  plane_x = pmouseX;
  plane_y = pmouseY;
  timer=0; // rand
  cap= int(random(1, 5 ));
  noStroke();
  smooth();

}
void draw() {
  background(255);
  timer++;
   // println(planeList.size());
  if (timer == cap && planeList.size() < 50) { 
    timer=0;
    planeList.add(new Plane(plane_x, plane_y));  
  }
  for (int i = 0; i<planeList.size(); i++) { 
    Plane plane_temp= (Plane) planeList.get(i);
    plane_temp.display();
    plane_temp.update();
  }



  fill(255);
  triangle(20, 20, 275, 20, 20, 230);
  triangle(20, 230, 275, 460, 20, 460);
  triangle(275, 20, 535, 20, 535, 230);
  triangle(535, 230, 535, 460, 275, 460);
  rect(0, 0, 550, 20);
  rect(0, 0, 20, 480);
  rect(530, 0, 20, 480);
  rect(0, 460, 550, 20);

}


void mouseClicked() {
  saveFrame("output-####.png");
  setup();
}
class Plane {
  float xspeed;
  float planeS;
  float planeR;

  float xpos, ypos;
  float xpos1,ypos1;

  float xpos2, ypos2;

  float xpos3, ypos3;

  float xpos4, ypos4;

  float angle;
  float loffset = 0.0;
  float roffset = 0.0;
  float c= random(0, 255);


  int selected = (int)random(0, 6);
  int k1[] = {0, 216, 225, 244, 219, 74};
  int k2[] = {77, 228, 209, 9, 207, 71};
  int k3[] = {150, 216, 0, 24, 157, 82};
  color r2 = color(k1[selected], k2[selected], k3[selected]);



  Plane(int plane_x, int plane_y) {
    planeS = random(1, 3);
    planeR = random(.001, 2);
    xpos = random(50, 185);
    ypos = random(50, 510);
    xspeed = random(2, 5);
    xpos1 = random(0, 5);
    ypos1 = random(0, 5);

    xpos2 = random(10, 15);
    ypos2 = random(0, 5);

    xpos3 = random(10, 15);
    ypos3 = random(20, 25);

    xpos4 = random(0, 5);
    ypos4 = random(20, 25);

    angle = random(0, TWO_PI);
  }
  void update() {
    xspeed = xspeed -= 0.03;
    if (xspeed < 0 && planeS < 0) {
      xspeed = 0;
    }
    else {
      xpos = xpos + xspeed;
      angle += 0.05;
      loffset = sin(angle) * 20;
      roffset = sin(angle) * 30;
    }
  }
  void display() {
    pushMatrix();
    translate(xpos, ypos);

    scale(planeS);
    fill(r2);
    rotate(planeR);
    quad(xpos1+loffset, ypos1+loffset, xpos2+roffset, ypos2+roffset, xpos3+roffset, ypos3+roffset, xpos4+loffset, ypos4+loffset);
    popMatrix();
  }
}

