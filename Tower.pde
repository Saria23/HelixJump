public class Tower {
  PShape cylinder;
  Platform[] plattforms;
  int storieHeight = 300;
  int currentPlattform = 0;
  float rotation;

  public Tower(int numOfPlattforms) {
    cylinder = createCylinder(10, 10, 1000000);
    plattforms = new Platform[numOfPlattforms];
    for (int i = 0; i < plattforms.length; i++) {
      plattforms[i] = new Platform(i == plattforms.length -1);
    }
  }

  public void draw() {    
    rotation = mouseX/float(height)*5;
    rotateY(rotation);
    shape(cylinder);
    noStroke();       // Linien vom Tower sollten verschwinden
    
    for (int i = 0; i < plattforms.length; i++) {
      plattforms[i].draw();
      translate(0, -storieHeight, 0);
    }
  }

  public PShape createCylinder(int sides, float r, float h) 
  {
    PShape cylinder = createShape(GROUP);

    float angle = -360 / sides;
    float halfHeight = h / 2;

    // draw sides
    fill(255, 105, 180);
    PShape middle = createShape();
    middle.beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < sides + 1; i++) {
      float x = cos( radians( i * angle ) ) * r;
      float z = sin( radians( i * angle ) ) * r;
      middle.vertex( x, halfHeight, z);
      middle.vertex( x, -halfHeight, z);
    }
    middle.endShape(CLOSE);
    cylinder.addChild(middle);

    return cylinder;
  }
  
  public SegmentType hit(Ball ball){
    pushMatrix();
    if(currentPlattform * storieHeight >= ball.posY)
    {
      plattforms[currentPlattform].giveHitResult(rotation);
    }
    popMatrix();
    return SegmentType.EMPTY;
    
  }
}
