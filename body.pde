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
// DRAW THE BODY HERE
/*--------------------------------------------------------------------------------*/
void drawMe(float numPoints, float noiseFactor, float shapeSize)
{ 
  // LOCAL VARIABLES
  // variables that don't change
  float rot = radians(360)/numPoints;
  float innerRadZero = 0;
  float outerRad = 50;
  float barrier = .95; 
  

  // BEGIN DRAWING THE BODY HERE
  pushMatrix();
  pushStyle();
  
  // move head to correct position
  translate(bodyX, bodyY);
  
  // color and stroke
  noStroke();
  fill(randomC1,randomC2,randomC3,220);
  
  // draw shape of head
  beginShape();
  
      for (int i=0; i<numPoints; i++) 
      {
        float angle = i*rot;
        float x = cos(angle);
        float y = sin(angle);
        float innerRad = shapeSize + noise(i*noiseFactor, frameCount*0.01) * shapeSize;
        if (i == 0) 
        {
          innerRadZero = innerRad;
        } 
        else if (i>numPoints*barrier) 
        {
          float perc = map(i, numPoints*barrier, numPoints, 0, 1);
          innerRad = lerp(innerRad, innerRadZero, perc);
        }
        vertex(x*innerRad, y*innerRad);
      }
  endShape(CLOSE);
  
  popStyle();
  popMatrix();
}
/*--------------------------------------------------------------------------------*/

}
