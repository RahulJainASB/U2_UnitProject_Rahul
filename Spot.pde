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
}