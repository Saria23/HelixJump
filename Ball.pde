class Ball {

  float posY = 80;
  float posX = 10;
  
  float velocityY = 2;
  float gravity = -2;
  float bounceVelocity = 1.5;

  float velocity = 0;
  float deltaTime;
  float lastMillis = 0;

  float radius = 1.5;

  void draw() {
    pushMatrix();               // Position vom Ball soll sich gemerkt werden
    translate(posX, posY, 0);
    sphere(radius*2);
    popMatrix();
  }

  void updatePhysics() {

    velocityY += gravity * deltaTime;
    posY += velocityY;

    update();
  }

  void bounce() {
    velocityY = bounceVelocity;
    popMatrix();
  }


  void update() {
    deltaTime = millis()-lastMillis;
    deltaTime /= 1000;
    println(millis()- lastMillis);
    lastMillis = millis();
  }
  
  PVector getPosition(){
    return new PVector(posX, posY, 0);
  }
}
