/*--------------------------------------------------------------------------------
GENERATES THE EYES
--------------------------------------------------------------------------------*/
class eyes
{

  
  
/*--------------------------------------------------------------------------------*/
eyes()
{
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
// DRAW OUR EYES
/*--------------------------------------------------------------------------------*/
void drawMe(float n1, float n2, float rollNumber)
{
    // CIRCLE (1)
    if(rollNumber == 1)
    {
      circleEyes(n1, n2, eyesX-20, eyesY);
      circleEyes(n1, n2, eyesX+20, eyesY);
    }
    // ELLIPSE (2)
    else if(rollNumber == 2)
    {
      circleEyes(n1, n2, eyesX-20, eyesY);
      circleEyes(n1, n2, eyesX+20, eyesY);
    }
    // SQUARE (3)
    else if(rollNumber == 3)
    {
      circleEyes(n1, n2, eyesX-20, eyesY);
      circleEyes(n1, n2, eyesX+20, eyesY);
    }
    // RECTANGLE (4)
    else if(rollNumber == 4)
    {
      circleEyes(n1, n2, eyesX-20, eyesY);
      circleEyes(n1, n2, eyesX+20, eyesY);
    }
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
// CIRCLE EYES
/*--------------------------------------------------------------------------------*/
void circleEyes(float n1, float n2, float x, float y)
{
  // LOCAL VARIABLES
  float pupilS = n1/2;
  float pupilX = n1/3;
  float pupilY = n1/3;
  
  
  // MAIN EYE
  pushStyle();
    fill(255);
    noStroke();
    ellipse(x,y,n1,n1);
  popStyle();
      
      
  // PUPIL
  pushMatrix();
  pushStyle();
    fill(0);
    noStroke();
    translate(x,y);
    
    // looking left
    if(body_location.x > mouseX)
    {
      pupilX = -pupilX;
    }
    // looking right
    else if(body_location.x < mouseX)
    {
      pupilX = pupilX;
    }
    // looking up
    if(body_location.y > mouseY)
    {
      pupilY = -pupilY;
    }
    // looking down
    else if(body_location.y < mouseY)
    {
      pupilY = pupilY;
    }
    
    ellipse(pupilX,pupilY,pupilS,pupilS);

  popStyle();
  popMatrix();
}
/*--------------------------------------------------------------------------------*/

}
