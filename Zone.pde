class Zone
{
  float x;
  float y;
  int zoneWidth;
  int zoneHeight;
  int score;

  // Constructer
  Zone()
  {
    zoneWidth = 200;
    zoneHeight = 200;
    score = 0;
    setPosition();
  }

  void setPosition()
  {
    x = random(0, width);
    y = random(0, height);
    
    if ((x+zoneWidth) > width)
    {
      x = width - zoneWidth;
    }
    
    if ((y+zoneHeight) > height)
    {
      y = height - zoneHeight;
    }
  }
  

  void draw()
  {
    fill(0, 240, 0);
    rect(x, y, zoneWidth, zoneHeight);
  }

  boolean isPersonInZone()
  {
    
      if(    ((x + zoneWidth) > v3.x   ) &&
      (  v3.x > x   ) &&
      ((y + zoneHeight) > v3.y   ) &&
      (  v3.y > y   ) )
    {
      return true;
    }
    return false;
  }
  
  void move()
  {
    x = random(0, width);
    y = random(0, height);
  }
  
}