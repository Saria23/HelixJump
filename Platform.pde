public class Platform {

  int numSegments = 14;
  float angle=0;
  float angleStep=radians(360f/numSegments);
  float pHeight = -20;
  float radius = 100;
  boolean foundEmpty=false;
  boolean finalPlatform;

  SegmentType[] segments = new SegmentType [numSegments];

  public Platform(boolean finalPlatform) {  // float difficulty für v2
    this.finalPlatform = finalPlatform;
    //setSegmentsV2(difficulty);
    setSegments();
    checkEmpty();  // Sicherstellen mind. 1x EMPTY
  }

  public void draw() {

    angle=0;

    for (int i=0; i<numSegments; i++) {


      if (segments[i]==SegmentType.GOOD) {

        fill(0, 150, 0);

        beginShape(TRIANGLE);
        vertex(0, 0, 0);
        vertex(cos(angle)*radius, 0, sin(angle)*radius);
        vertex(cos(angle+angleStep)*radius, 0, sin(angle+angleStep)*radius);

        endShape();

        beginShape(TRIANGLE_STRIP);
        vertex(0, 0, 0);
        vertex(0, pHeight, 0);

        vertex(cos(angle)*radius, 0, sin(angle)*radius);
        vertex(cos(angle)*radius, pHeight, sin(angle)*radius);

        angle += angleStep;
        vertex(cos(angle)*radius, 0, sin(angle)*radius); //verschieben nach anglestep in Aufgabe
        vertex(cos(angle)*radius, pHeight, sin(angle)*radius);

        vertex(0, 0, 0);
        vertex(0, pHeight, 0);
        endShape();
      } else if (segments[i]==SegmentType.BAD) {

        fill(250, 0, 0);

        beginShape(TRIANGLE);
        vertex(0, 0, 0);
        vertex(cos(angle)*radius, 0, sin(angle)*radius);
        vertex(cos(angle+angleStep)*radius, 0, sin(angle+angleStep)*radius);

        endShape();

        beginShape(TRIANGLE_STRIP);
        vertex(0, 0, 0);
        vertex(0, pHeight, 0);

        vertex(cos(angle)*radius, 0, sin(angle)*radius);
        vertex(cos(angle)*radius, pHeight, sin(angle)*radius);

        angle += angleStep;
        vertex(cos(angle)*radius, 0, sin(angle)*radius); //verschieben nach anglestep in Aufgabe
        vertex(cos(angle)*radius, pHeight, sin(angle)*radius);

        vertex(0, 0, 0);
        vertex(0, pHeight, 0);
        endShape();
      } else if (segments[i]==SegmentType.EMPTY) { 
        angle += angleStep;
      }
    }
  }

  public SegmentType giveHitResult(float towerRotation) { //erhalten der Gradzahl Drehung des Balls bsp 120, 16 Segemente angle= 22,5

    if(finalPlatform){
       return SegmentType.FINAL; 
    }
    
    float i =  towerRotation/(360f/numSegments); //120/22,5=5,3
    int hitSegment = (int) i-1;
    if (hitSegment < 0) {
      hitSegment=0;
    }
    return segments[hitSegment];
  }

  public void checkEmpty() {
    foundEmpty=false;
    for (int i=0; i<numSegments; i++) {    // Sicherstellen mind. 1x EMPTY

      if (segments[i]==SegmentType.EMPTY) {
        foundEmpty=true;
      }
    }

    if (foundEmpty==false) {
      segments[0]=SegmentType.EMPTY;
    }
  }

  public void setSegments() {
    for (int i=0; i<numSegments; i++) {
      float r = random(11);

      if (r<=8) {                               //range von r 1-120    100-120 empty        1-100
        segments[i] = SegmentType.GOOD;
      } else if (r> 8 && r< 10) {
        segments[i]=  SegmentType.EMPTY;
      } else if (r >= 10) {
        segments[i]=  SegmentType.BAD;
      }
    }
  }
  public void setSegmentsV2(float difficulty) { //difficulty 1-100   1=easy ab 50 hardcore, 100=impossible

    for (int i=0; i<numSegments; i++) {
      float r = random(120);

      if (r<=difficulty) {
        segments[i] = SegmentType.BAD;
      } else if (r> difficulty && r< 100) {
        segments[i]=  SegmentType.GOOD;
      } else if (r >= 100) {
        segments[i]=  SegmentType.EMPTY;
      }
    }
  }
  
}
