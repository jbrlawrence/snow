import processing.video.*;

Capture camera;

void setup() {
  size(640, 480);

  camera = new Capture(this, 640, 480);


  // Start capturing the images from the camera
  camera.start();

  frameRate(1);
}

PImage myimage = createImage(640, 480, ARGB);
int[] oldPix = new int[640*360];
PGraphics pg;
int counter = 0;
int split = 3;

void draw() {
  if (camera.available() == true) {
    camera.read();
    
    image(camera, 0, 0, width, height);
    for (int i = 0; i < counter; i++) {
      loadPixels();
      myimage.loadPixels();
      myimage.pixels = pixels;
  
      myimage.updatePixels();
      int xPos = (i%split)*width/split;
      int yPos = (i/split)*height/split;
      image(myimage, xPos, yPos, width/split, height/split);
    }
    saveFrame();
    counter++;
  }
}
