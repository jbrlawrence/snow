//*** Michael Snow - Code for activity 1 - Algorithms ***//
// the following code uses a webcam to re-create the process behind the artwork "Authorization", 1969 by Michael Snow

// using the Processing video library to access the computer webcam 
import processing.video.*;
Capture camera;

void setup() {
  // setting up the canvas and webcam to have the same size
  size(640, 480);
  camera = new Capture(this, 640, 480);


  // Starting to capture images from the camera
  camera.start();
  
  // setting the framerate slow enough to see the effect
  frameRate(1);
}

// setting up a Processing image variable to save part of the screen image
PImage myImage = createImage(640, 480, ARGB);
int counter = 0;

void draw() {
  // checking if the camera is working, then reading from the camera
  if (camera.available() == true) {
    camera.read();
    
    // putting the image from the camera on the screen
    image(camera, 0, 0, width, height);
    
    // taking the image from the camera, shrinking it and placing copies on the screen
    // as counter increases the number of copies does as well
    for (int i = 0; i < counter; i++) {
      // load the pixels currently on the screen and write them to the myImage variable
      loadPixels();
      myImage.loadPixels();
      myImage.pixels = pixels;
      
     // updating the pixels saved in myImage
      myImage.updatePixels();
      // some fun modulo arithmetic to place the images in different part of the screen
      int xPos = (i%3)*width/3;
      int yPos = (i/3)*height/3;
      // updating the screen with the image saved in myImage
      image(myImage, xPos, yPos, width/3, height/3);
    }
    // save the image to the Processing folder and increase the counter for the next frame
    saveFrame("polaroid-##.png");
    counter++;
  }
}
