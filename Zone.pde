// TThis is class Zone
// It draws the zone and checks for collisions to move it and add to the score 

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

    if ( (x > (width - zoneWidth)))
    {
      x = width - zoneWidth;
    }

    if ( (y > (height - zoneHeight)))
    {
      y = height - zoneHeight;
    }
  }


  void draw()
  {
    fill(0, 240, 0);
    rect(x, y, zoneWidth, zoneHeight);
  }


  boolean isPointInsideZone(float x1, float y1)
  {

    if ( (x1 < x ) ||
      (x1 > (x + zoneWidth) )||
      (y1 < y ) ||
      (y1 > (y + zoneHeight)))
    {
      return false;
    } else
    {
      return true;
    }
    /*
  if(    ((x + zoneWidth) > x1   ) &&
     (  x1 > x   ) &&
     ((y + zoneHeight) > y1   ) &&
     (  y1 > y   ) )
     {
     return true;
     }
     return false;
     */
  }

  boolean isPersonInZone()
  {
    return isPointInsideZone(v3.x, v3.y);
  }

  void move()
  {
    setPosition();    
    wolf.setSpeed();
  }
}