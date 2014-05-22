class Quadruped{
  
  PVector spineHead, spineTail, head, tail;
  PVector legPosition;
  float legLength, legAngle, neckLength, headAngle;
  float speed;
  
  
  Quadruped(float xRoot, float yRoot, float spineLength, float legLength, float neckLength)
  {
    spineHead = new PVector(xRoot, yRoot);
    spineTail = new PVector(xRoot - spineLength, yRoot);
    head      = new PVector(spineHead.x + neckLength, spineHead.y);
    tail      = new PVector(spineTail.x - neckLength, spineTail.y);
    legPosition = new PVector(spineHead.x, spineHead.y + legLength);
    this.legLength = legLength;
    this.neckLength = neckLength;
    speed = random(0,2);
  }  
  
//  Quadruped(float spineXHead, float spineYHead, float spineXTail, float spineYTail, float givenLegLength, float givenHeadX, float givenHeadY, float givenTailX, float givenTailY)
//  {
//    spineHead = new PVector(spineXHead, spineYHead);
//    spineTail = new PVector(spineXTail, spineYTail);
//    head      = new PVector(givenHeadX, givenHeadY);
//    tail      = new PVector(givenTailX, givenTailY);
//    legLength  = givenLegLength;
//  }  
  
  
  void update()
  {
    headAngle = (mouseY/float(height) - 0.5) * -PI;
    legAngle  = (mouseX/float(width) - 0.5) * -PI;
    float spineLength = spineHead.x - spineTail.x;
    spineHead.x = (spineHead.x + speed) % width; 
    spineTail.x = spineHead.x - spineLength;
  }
  
  void render()
  {
    stroke(255,0,0);
    drawHead();
    drawTail();
    stroke(0,255,0);
    drawSpine();
    stroke(0,0,255);
    drawLeg(spineHead);
    drawLeg(spineTail);
    
  }
  
  void drawSpine()
  {
    line(spineHead.x, spineHead.y, spineTail.x, spineTail.y);
  }
  
  void drawHead()
  {
//    line(spineHead.x, spineHead.y, head.x, head.y);
    pushMatrix();
    translate(spineHead.x, spineHead.y);
    rotate(headAngle);
    stroke(0,255,255);
    line(0, 0, neckLength, 0);
    popMatrix();
  }
  
  void drawTail()
  {
    pushMatrix();
    translate(spineTail.x, spineTail.y);
    rotate(headAngle);
    stroke(255, 0, 255);
    line(-neckLength, 0, 0, 0);
    popMatrix();
  }
  
  void drawLeg(PVector rootPosition)
  {
    pushMatrix();
    translate(rootPosition.x, rootPosition.y);
    rotate(legAngle);
    line(0, 0, 0, legLength);
    popMatrix();
    pushMatrix();
    translate(rootPosition.x, rootPosition.y);
    rotate(map(legAngle, -1.6, 1.6, 1.6, -1.6)); //invert the angle to draw the opposite leg 
    line(0, 0, 0, legLength);
    popMatrix();
  }
  
  
}
