class Wolf
{
  PImage picture;
  float x;
  float y;
  int wolfWidth;
  int wolfHeight;
  float xSpeed;
  float ySpeed;
  int oldTime;
  int newTime;
  int numOfSeconds;

  //Constructer
  Wolf()
  {
    x = random(0, (width-wolfWidth));
    y = random(0, (height-wolfHeight));
    wolfWidth = 300;
    wolfHeight = 300;
    oldTime = newTime = millis();
    numOfSeconds = 5;
  }

  void draw() 
  {
    image(picture, x, y, wolfWidth, wolfHeight);

    newTime = second();

    if (newTime != oldTime)
    {
      println (oldTime, "       ", newTime);
      move();
      oldTime = newTime;
    }
  }





  boolean hasWolfCollided()
  {
    if (    ((x + wolfWidth) > v3.x   ) &&
      (  v3.x > x   ) &&
      ((y + wolfHeight) > v3.y   ) &&
      (  v3.y > y   ) )
    {
      return true;
    }
    return false;
  }
  
  void move()
  {
    x = ( x + ((zone.x-x)/numOfSeconds));
    y = ( y + ((zone.y-y)/numOfSeconds));

  /*  
  if( x > zone.x)
    {
      x = x - ((x - zone.x)/numOfSeconds);
    }
    else
    {
      x = x - ((zone.x - x)/numOfSeconds);
    }
    
    if( y > zone.y)
    {
      y =  y - ((y - zone.y)/numOfSeconds);
    }
    else
    {
      y = y - ((zone.y - y)/numOfSeconds);
    }
    */
    
    
    
//    x = (x - zone.x)/numOfSeconds;
//    y = (y - zone.y)/numOfSeconds;
  }
}