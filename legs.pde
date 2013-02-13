/*--------------------------------------------------------------------------------
GENERATES THE LEGS
--------------------------------------------------------------------------------*/
class legs
{

  
  
/*--------------------------------------------------------------------------------*/
legs()
{
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
// ALL LEGS GET DRAWN HERE
/*--------------------------------------------------------------------------------*/
void drawMe()
{
  // roll a random number to the number of legs
  int rollNumber = int( random(1,4) );
  //println(rollNumber);
  //println(legY);
  
  
  // FOR MY REFERENCE, AGAIN!
//  pushStyle();
//    noFill();
//    stroke(0);
//    strokeWeight(5);
//    point(20,20);
//    aLeg(20,20);
//  popStyle();
  
   
  // FOUR LEGS
  if(rollNumber == 1)
  {
    aLeg(legX-20,legY);
    aLeg(legX,legY);
    aLeg(legX+20,legY);
    aLeg(legX+40,legY);
  }
  
  // FIVE LEGS
  if(rollNumber == 2)
  {
    aLeg(legX-40,legY);
    aLeg(legX-20,legY);
    aLeg(legX,legY);
    aLeg(legX+20,legY);
    aLeg(legX+40,legY);
  }
  
  // SIX LEGS
  if(rollNumber == 3)
  {
    aLeg(legX-60,legY);
    aLeg(legX-40,legY);
    aLeg(legX-20,legY);
    aLeg(legX,legY);
    aLeg(legX+20,legY);
    aLeg(legX+40,legY);
  }
  
  // SEVEN LEGS
  if(rollNumber == 4)
  {
    aLeg(legX-60,legY);
    aLeg(legX-40,legY);
    aLeg(legX-20,legY);
    aLeg(legX,legY);
    aLeg(legX+20,legY);
    aLeg(legX+40,legY);
    aLeg(legX+60,legY);
  }
  
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
// A LEG BLUEPRINT
/*--------------------------------------------------------------------------------*/
void aLeg(float posX, float posY)
{
  // RANDOM VARIABLES
  // we want the start point to be 0,0 inside the body
    float x1 = 0;
    float y1 = 0;
  // all the x values
    float x2 = random(0,30);
    float x3 = random(-10,30);
    float x4 = random(-20,30);
  // all the y values
    float y2 = 0;
    float y3 = random(120,200);
    float y4 = random(220,250);
  
  
  pushMatrix();
    pushStyle();
      translate(posX,posY);
      strokeWeight(10);
      stroke(randomC1-100,randomC2,randomC3);
      curve(x1, y1, x2, y2, x3, y3, x4, y4);
    popStyle();
  popMatrix();
}
/*--------------------------------------------------------------------------------*/

}
