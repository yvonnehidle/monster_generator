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
void drawMe()
{
  // roll a random number to determine eyes
  int rollNumber = int( random(1,5) );
  float n1 = random(5,15);
  float n2 = random(3,18);
  
  rectMode(CENTER);
  //println(rollNumber);
  
  pushMatrix();
  translate(eyesX,eyesY);
  
    // CIRCLE (1)
    if(rollNumber == 1)
    {
      // main eye
      pushStyle();
        fill(255);
        noStroke();
        ellipse(0,0,n1,n1);
        ellipse(20,0,n1,n1);
      popStyle();
      
      // pupil
      pushStyle();
        fill(0);
        noStroke();
        ellipse(0,0,n1/2,n1/2);
        ellipse(20,0,n1/2,n1/2);
      popStyle();
    }
    
    
    // ELLIPSE (2)
    else if(rollNumber == 2)
    {
      // main eye
      pushStyle();
        fill(255);
        noStroke();
        rect(0,0,n1,n2);
        rect(20,0,n1,n2);
      popStyle();
      
      // pupil
      pushStyle();
        fill(0);
        noStroke();
        rect(0,0,n1/2,n2/2);
        rect(20,0,n1/2,n2/2);
      popStyle();
    }
    
    
    // SQUARE (3)
    else if(rollNumber == 3)
    {
      // main eye
      pushStyle();
        fill(255);
        noStroke();
        rect(0,0,n1,n1);
        rect(20,0,n1,n1);
      popStyle();
     
     // pupil
     pushStyle();
        fill(0);
        noStroke();
        rect(0,0,n1/2,n1/2);
        rect(20,0,n1/2,n1/2);
     popStyle();
    }
    
    
    // RECTANGLE (4)
    else if(rollNumber == 4)
    {
      // main eye
      pushStyle();
        fill(255);
        noStroke();
        rect(0,0,n1,n2);
        rect(20,0,n1,n2);
      popStyle();
      
      // pupil
      pushStyle();
        fill(0);
        noStroke();
        rect(0,0,n1/2,n2/2);
        rect(20,0,n1/2,n2/2);
      popStyle();
    }
  
  popMatrix();
}
/*--------------------------------------------------------------------------------*/

}
