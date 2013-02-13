/*--------------------------------------------------------------------------------
GENERATES THE TAIL(S)
--------------------------------------------------------------------------------*/
class tail
{

  
  
/*--------------------------------------------------------------------------------*/
tail()
{
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
void drawMe()
{
  // roll a random number to determine eyes
  int rollNumber = int( random(1,5) );
  
  // random variables
  float x1 = 0;
  float y1 = 0;
  float x2 = random(0,50);
  float y2 = random(50,100);
  float x3 = random(0,50);
  float y3 = random(100,200);
  float x4 = random(0,50);
  float y4 = random(100,200);
  
  pushMatrix();
    pushStyle();
        translate(tailX+100, tailY-100);
        strokeWeight(10);
        stroke(randomC1-100,randomC2,randomC3);
        curve(x1, y1, x2, y2, x3, y3, x4, y4);
    popStyle();
  popMatrix();
}
/*--------------------------------------------------------------------------------*/


}
