Ball spielball;
Tower tower;
float platformSurface = -50;
float cameraYpos = 30;

void setup () {
  size(800, 900, P3D);
  spielball = new Ball();
  tower = new Tower(20);
}

void draw() {
  background(230);
  noStroke();
  drawAxis(60);
  camera(100, cameraYpos, 0, 0, cameraYpos, 0, 0, -1, 0);         //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ
  noStroke();
  lights();

  if (cameraYpos > spielball.posY) {      //camera moves only when ball falls
    cameraYpos = spielball.posY;
  }
  
  tower.draw();
  spielball.draw();  //renders ball
  spielball.updatePhysics();                  //gives ball gravity and bounce physics

  SegmentType hitResult = tower.hit(spielball);      //if

  switch (hitResult) {
  case GOOD:
    spielball.bounce();
    break;
  case BAD:
    //reset game
    break;
  case FINAL:
    println ("Nice, haste g'wonna");
    break;
  }
}

//Setup Camera

//draw Ball

//draw Tower

// ask tower for it by passing the ball into the function


void drawAxis(float size) {          //draws coordinate system
  int brightness = 192;

  stroke(brightness, 0, 0);        // x = red
  line(0, 0, 0, size, 0, 0);

  stroke(0, brightness, 0);        // x = green
  line(0, 0, 0, 0, size, 0);

  stroke(0, 0, brightness);        // x = blue
  line(0, 0, 0, 0, 0, size);
}
