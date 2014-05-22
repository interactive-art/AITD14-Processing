Quadruped[] quadrupedList;

void setup()
{
  size(900, 600);
  smooth();
  strokeWeight(5);
  quadrupedList = new Quadruped[5];
  for(int i = 0; i < quadrupedList.length; i++)
  {
    float yPos = random(500);
    float xPos = random(75,525);
    quadrupedList[i] = new Quadruped(xPos, yPos, random(75,125), random(35,75), random(15,50));
  }
}

void draw()
{
  println(frameRate);
  background(255);
  for(Quadruped animal : quadrupedList)
  { 
    animal.update();
  }
  for(Quadruped animal : quadrupedList)
  { 
    animal.render();
  }
}
