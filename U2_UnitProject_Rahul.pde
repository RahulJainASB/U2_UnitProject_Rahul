import org.openkinect.freenect.*;
import org.openkinect.processing.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;

Spot spot;
Wolf wolf;

void setup() 
{
  fullScreen();
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  spot = new Spot();
  wolf = new Wolf();
  wolf.picture = loadImage("Wolf.png");
}

void draw() 
{
  background(255);

  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();

  // Let's draw the raw location
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  PVector v3 = new PVector(0,0);
  
  v3.x = map(int(v1.x), 0, 640, 0, int(width));
  v3.y = map(int(v1.y), 0, 480, 0, int(height));
  ellipse(v3.x, v3.y, 20, 20);

  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  PVector v4 = new PVector(0,0);
  
  v3.x = map(int(v2.x), 0, 640, 0, int(width));
  v3.y = map(int(v2.y), 0, 480, 0, int(height));
  ellipse(v4.x, v4.y, 20, 20);
  ellipse(v4.x, v4.y, 20, 20);

  // Display some info
  int t = tracker.getThreshold();
  fill(0);
  
  
  spot.draw();
  wolf.draw();
}
/*
// Adjust the threshold with key presses
void keyPressed() {
  int t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
      t+=5;
      tracker.setThreshold(t);
    } else if (keyCode == DOWN) {
      t-=5;
      tracker.setThreshold(t);
    }
  }
}
*/