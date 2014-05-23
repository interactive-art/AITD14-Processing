abstract class Walker extends Creature {
  
  PVector spineHead, spineTail;                               // can refer to the same object
  float neckLength, legLength, spineLength, speedMultiplier;  // from constructor
  float headAngle, legAngle;                                  // internally calculated
  color colour;
  
  Walker(float spineHeadX, float spineHeadY, float spineLength, float neckLength, float legLength, float speedMultiplier, color colour)
  {
    spineHead = new PVector(spineHeadX, spineHeadY);
    spineTail = new PVector(spineHeadX - spineLength, spineHeadY);
    this.spineLength = spineLength;
    this.neckLength = neckLength;
    this.legLength  = legLength;
    this.speedMultiplier = speedMultiplier;
    this.colour = colour;
  }  
  
  void update()
  {
    headAngle = (mouseY/float(height) - 0.5) * -PI;
    legAngle  = (mouseX/float(width) - 0.5) * -PI;
    spineHead.x = (spineHead.x + speedMultiplier) % width; 
    spineTail.x = spineHead.x - spineLength;
  }
  
  abstract void render();
  
  void renderCommon()
  { 
    stroke(colour);
    drawHead();
    drawSpine();
    drawTail();
  }
  
  abstract void renderLegs();
  
  void drawSpine()
  {
    line(spineHead.x, spineHead.y, spineTail.x, spineTail.y);
  }
  
  void drawHead()
  {
    drawEnd(true, spineHead);
  }
  
  void drawTail()
  {
    drawEnd(false, spineTail);
  }
  
  void drawEnd(boolean drawHead, PVector rootNode)
  {
    pushMatrix();
    translate(rootNode.x, rootNode.y);
    rotate(headAngle);
    if(drawHead){
      line(0, 0, neckLength, 0);
    }
    else{
      line(-neckLength, 0, 0, 0);
    }
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
