class Spot
{
  float x;
  float y;
  int spotWidth;
  int spotHeight;

  // Constructer
  Spot()
  {
    x = random(0, width);
    y = random(0, height);
    spotWidth = 200;
    spotHeight = 200;
  }

  void draw()
  {
    fill(0, 255, 0);
    rect(x, y, spotWidth, spotHeight);
  }

  boolean isPersonInSpot()
  {
      if(    ((x + spotWidth) > v3.x   ) &&
      (  v3.x > x   ) &&
      ((y + spotHeight) > v3.y   ) &&
      (  v3.y > y   ) )
    {
      return true;
    }
    return false;
  }
}