import org.openkinect.processing.*;

Kinect kinect;
PImage img;

void setup()
{
  fullScreen();
  kinect = new Kinect(this);

  kinect.initDepth();
  imageMode(CENTER);
}

void draw()
{
  background(0);
  img = kinect.getDepthImage(); 
  image(img, width/2, height/2); 
}