class Wolf
{
  PImage picture;
  float x;
  float y;
  int wolfWidth;
  int wolfHeight;
  float xSpeed;
  float ySpeed;

  //Constructer
  Wolf()
  {
  x = random(0, width);
  y = random(0, height);
  wolfWidth = 300;
  wolfHeight = 300;
  }
  
  void draw() 
  {
    image(picture, x, y, wolfWidth, wolfHeight);
  }
  

  boolean hasWolfCollided()
  {
      if(    ((x + wolfWidth) > v3.x   ) &&
      (  v3.x > x   ) &&
      ((y + wolfHeight) > v3.y   ) &&
      (  v3.y > y   ) )
    {
      return true;
    }
    return false;
  }
}