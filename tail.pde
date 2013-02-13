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
  
  pushMatrix();
      translate(tailX, tailY);
      tail(0);
  popMatrix();
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
void tail(int depth)
{ 
  // LOCAL VARIABLES
  // variables that change
  float branchRot1 = noise( random(0,180) );
  float branchRot2 = noise( random(-180,0) );
  float tailWidth1 = 20;
  float tailWidth2 = 150;
  
  
  pushStyle();
    // tree branch style
    strokeWeight( random (.5, 2) );
    stroke(randomC1-100,randomC2,randomC3);
    strokeCap(ROUND);
    
    // this is the tree trunk
    line(0,0,tailWidth2,0);
    
    // all recursive functions must have an exit condition
    // when the depth is less than 10, depth is 0
    if (depth < 8) 
    {
      pushMatrix(); // save the current state of the transformation
      translate(tailWidth1,0); // move the tree
      rotate(branchRot1); // then rotate the branches
      scale(.6); 
      tail(depth + 1);
      popMatrix();
      
      // height of tree
      pushMatrix(); // save the current state of the transformation
      translate(tailWidth2,0); // move the tree
      rotate(branchRot2); // then rotatet the branches
      scale(.4);
      tail(depth + 1);
      popMatrix();
    }
  popStyle();
  
}
/*--------------------------------------------------------------------------------*/

}
