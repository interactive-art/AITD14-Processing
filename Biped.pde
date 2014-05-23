class Biped extends Walker{
  
  Biped(float spineHeadX, float spineHeadY, float spineLength, float neckLength, float legLength, float speedMultiplier)
  {
    super(spineHeadX, spineHeadY, spineLength, neckLength, legLength, speedMultiplier);
  }
  
  void render()
  {
    super.renderCommon();
    renderLegs();
  }
  
  void renderLegs()
  {
    drawLeg(spineTail);
  } 
  
}
