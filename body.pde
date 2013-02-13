/*--------------------------------------------------------------------------------
GENERATES THE BODY

CREDITS
  Noise code based off:
  - https://forum.processing.org/topic/how-to-make-perlin-noise-loop
--------------------------------------------------------------------------------*/
class body
{
  

/*--------------------------------------------------------------------------------*/
body()
{
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
void drawMe()
{ 
  // LOCAL VARIABLES
  // variables that change
  float numPoints = random(10, 300);                    // the higher the number the more wiggly
  float noiseFactor = random(0, 5);                    // the higher the number the more spikey
  float shapeSize = random(50,65);
  
  // variables that don't change
  float rot = radians(360)/numPoints;
  float innerRadZero = 0;
  float outerRad = 50;
  float barrier = .95;
  
  
  
  // BEGIN DRAWING THE NECK HERE
  // you won't see it in most cases, but it's good to have it here
  pushStyle();
    stroke(randomC1,randomC2,randomC3);
    strokeWeight(20);
    line(headX,headY,bodyX,bodyY);
  popStyle();
  
  

  // BEGIN DRAWING THE BODY HERE
  pushMatrix();
  pushStyle();
  
  // move head to correct position
  translate(bodyX, bodyY);
  
  // color and stroke
  noStroke();
  tint(randomC1,randomC2,randomC3);
  PImage paper = loadImage("paperbg.png");
  
  // draw shape of head
  beginShape();
  texture(paper);
  
      for (int i=0; i<numPoints; i++) 
      {
        float angle = i*rot;
        float x = cos(angle);
        float y = sin(angle);
        float innerRad = shapeSize + noise(i*noiseFactor, frameCount*0.01) * shapeSize*2;
        if (i == 0) 
        {
          innerRadZero = innerRad;
        } 
        else if (i>numPoints*barrier) 
        {
          float perc = map(i, numPoints*barrier, numPoints, 0, 1);
          innerRad = lerp(innerRad, innerRadZero, perc);
        }
        vertex(x*innerRad, y*innerRad,0,0);
        vertex(x*innerRad, y*innerRad,300,0);
        vertex(x*innerRad, y*innerRad,300,300);
        vertex(x*innerRad, y*innerRad,0,300);
      }
  endShape();
  
  popStyle();
  popMatrix();
}
/*--------------------------------------------------------------------------------*/

}
