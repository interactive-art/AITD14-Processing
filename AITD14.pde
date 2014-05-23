ArrayList<Walker> walkerList;

void setup()
{
  size(900, 600);
  smooth();
  strokeWeight(5);
  walkerList = new ArrayList<Walker>();
  for(int i = 0; i < 5; i++)
  {
    float yPos = random(500);
    float xPos = random(75,525);
    walkerList.add(new Quadruped(xPos, yPos, random(75,125), random(15,50), random(35,75), random(0, 1.5)));
  }
  for(int i = 0; i < 5; i++)
  {
    float yPos = random(500);
    float xPos = random(75,525);
    walkerList.add(new Biped(xPos, yPos, random(0,15), random(15,50), random(35,75), random(0, 1.5)));
  }
}

void draw()
{
  println(frameRate);
  background(255);
  for(Walker animal : walkerList)
  { 
    animal.update();
  }
  for(Walker animal : walkerList)
  { 
    animal.render();
  }
}
