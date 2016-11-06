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
  boolean keepMoving;

  //Constructer
  Wolf()
  {
    wolfWidth = 180;
    wolfHeight = 300;
    x = random(0, width);
    y = random(0, height);
    oldTime = newTime = millis();
    numOfSeconds = 50;
    xSpeed = 0;
    ySpeed = 0;
    keepMoving = true;
  }

  void draw() 
  {
    // Draw the wolf
    image(picture, x, y, wolfWidth, wolfHeight);
    
    //Move the wolf after a milli-second. 
      newTime = millis();
      if( (newTime != oldTime) && ( keepMoving == true ))
      {
        move();
        oldTime = newTime;
      }
    

// Check if the wolf has collided with the Zone. If so, stop the game
    if (hasWolfCollided() == true)
    {
      // Game is over
      endgame = true;
      keepMoving = false;
    }
    
  }

  boolean hasWolfCollided()
  {
    return zone.isPointInsideZone((x + 151), (y + 25));
  }
    
  void move()
  {
    if (( xSpeed == 0) || ( ySpeed == 0))
    {
      setSpeed();
    }
    x = ( x + xSpeed);
    y = ( y + ySpeed);
  }

  void setSpeed()
  {
    xSpeed = ((zone.x-x)/numOfSeconds);
    ySpeed = ((zone.y-y)/numOfSeconds);
  }
}