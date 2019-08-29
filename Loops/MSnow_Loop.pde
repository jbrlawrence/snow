//*** Michael Snow - Code for activity 2 - Loops ***//
// the following code uses a loop to create an abstract work inspired by Michael Snow's "Recombinant" 1992

void setup(){
  // setting the canvas size, background colour and drawing colours/settings
  size(640,480);
  background(20,40,90);
  stroke(255);
  noFill();
  strokeWeight(1.5);
  // a loop to run 100 times to repeat the action of drawing a curve
  for (int i =0 ; i <100; i++){
    // setting inputs to the bezier curve that will be drawn, using a combination of static and random values
    float x1 = 0;
    float x2 = random(20,40);
    float y1 = random(height/2-20,height/2+20);
    float y2 = y1;
    float x3 = random(0,width);
    float x4 = width;
    float y3 = random(0,height);
    float y4 = random(50,height-50);
    // drawing the bezier using the variables defined above
    bezier(x1,y1,x2,y2,x3,y3,x4,y4);
  }
  // after drawing 100 curves, save the image
  saveFrame("snowLoop.png");
}
