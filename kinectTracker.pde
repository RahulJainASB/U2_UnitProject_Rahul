// This is class Kinect Tracker
// It displays the kinect's readings on depth and from its camera

class KinectTracker 
{

  // Depth threshold
  int threshold = 950;

  // Raw location
  PVector loc;

  // Interpolated location
  PVector lerpedLoc;

  // Depth data
  int[] depth;

  // Video
  PImage display;

  KinectTracker() 
  {
    kinect.initDepth();
    kinect.enableMirror(true);
    // Make a blank image
    display = createImage(kinect.width, kinect.height, RGB);
    // Set up the vectors
    loc = new PVector(0, 0);
    lerpedLoc = new PVector(0, 0);
  }

  void track() 
  {
    // Get the raw depth as array of integers
    depth = kinect.getRawDepth();

    if (depth == null) return;

    float sumX = 0;
    float sumY = 0;
    float count = 0;

    for (int x = 0; x < kinect.width; x++) 
    {
      for (int y = 0; y < kinect.height; y++) 
      {

        int offset =  x + y*kinect.width;
        int rawDepth = depth[offset];

        if (rawDepth < threshold) 
        {
          sumX += x;
          sumY += y;
          count++;
        }
      }
    }
    if (count != 0) 
    {
      loc = new PVector(sumX/count, sumY/count);
    }

    lerpedLoc.x = PApplet.lerp(lerpedLoc.x, loc.x, 0.3f);
    lerpedLoc.y = PApplet.lerp(lerpedLoc.y, loc.y, 0.3f);
  }

  PVector getLerpedPos() 
  {
    return lerpedLoc;
  }

  PVector getPos() 
  {
    return loc;
  }

  void display() 
  {
    PImage img = kinect.getDepthImage();

    if (depth == null || img == null) return;

    // Depth image rewrote to show which pixels are in threshold
    display.loadPixels();
    for (int x = 0; x < kinect.width; x++) 
    {
      for (int y = 0; y < kinect.height; y++) 
      {

        int offset = x + y * kinect.width;
        // Raw depth
        int rawDepth = depth[offset];
        int pix = x + y * display.width;
        if (rawDepth < threshold) {
          // Changing the color to red
          display.pixels[pix] = color(150, 50, 50);
        } else {
          display.pixels[pix] = img.pixels[offset];
        }
      }
    }
    display.updatePixels();

    PImage fullImage = display.get();
    // Resized the image
    fullImage.resize(width, height);
    // Draw the image
    image(fullImage, 0, 0);
  }

  int getThreshold() 
  {
    return threshold;
  }

  void setThreshold(int t) 
  {
    threshold =  t;
  }
}