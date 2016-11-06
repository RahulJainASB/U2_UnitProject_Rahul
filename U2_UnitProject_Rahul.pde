/*
Safe Zone by Rahul Jain
This project is a game in which the player must move his average point to a defined range (the safe zone) in a timely manner to reach there before a wolf. 
*/


import org.openkinect.freenect.*;
import org.openkinect.processing.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;
PVector v3;

Zone zone;
Wolf wolf;
boolean endgame;

void setup() 
{
  fullScreen();
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  zone = new Zone();
  wolf = new Wolf();
  wolf.picture = loadImage("Wolf.png");
  endgame = false;
}

void draw() 
{

  if (endgame == true)
  {
    background(0);
    textSize(24);
    text("Game Over", 75, 400);
    String s = "Your score is:   " + zone.score;
    text(s, 75, 500);
  } 
  else
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
    v3 = new PVector(0, 0);

    v3.x = map(int(v1.x), 0, 640, 0, int(width));
    v3.y = map(int(v1.y), 0, 480, 0, int(height));
    ellipse(v3.x, v3.y, 20, 20);

    // Let's draw the "lerped" location
    PVector v2 = tracker.getLerpedPos();
    fill(100, 250, 50, 200);
    noStroke();
    PVector v4 = new PVector(0, 0);

    v3.x = map(int(v2.x), 0, 640, 0, int(width));
    v3.y = map(int(v2.y), 0, 480, 0, int(height));
    v4.x = map(int(v2.x), 0, 640, 0, int(width));
    v4.y = map(int(v2.y), 0, 480, 0, int(height));
    ellipse(v4.x, v4.y, 20, 20);
    ellipse(v4.x, v4.y, 20, 20);

    // Display some info
    int t = tracker.getThreshold();
    fill(0);


    zone.draw();
    wolf.draw();

    if ( zone.isPersonInZone () == true)
    {
      zone.score++;
      zone.move();
    }
  }
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