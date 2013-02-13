/*--------------------------------------------------------------------------------
GENERATES THE EARS/ANTLERS

CREDITS
  Tree code based off:
  - http://www.openprocessing.org/sketch/7150
  - http://processing.org/learning/topics/tree.html
--------------------------------------------------------------------------------*/
class ears
{
  float headXref;
  float headYref;

  

/*--------------------------------------------------------------------------------*/
ears()
{
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
void drawMe()
{ 
  
  // roll a random number to determine eyes
  int rollNumber = int( random(1,5) );
  //println(rollNumber);
  
  
  // CIRCLE EARS (1)
  if(rollNumber == 1)
  {
  }
  
  // RECTANGLE EARS (2)
  if(rollNumber == 2)
  {
  }
  
  // TREE-LIKE ANTLERS, 2 SETS (3)
  if(rollNumber == 3)
  {
    pushMatrix();
      translate(earsX-20, earsY);
      antlers(0);
    popMatrix();
    pushMatrix();
      translate(earsX+20, earsY);
      antlers(0);
    popMatrix();
  }
  
  // TREE-LIKE ANTLERS, 1 SET (4)
  if(rollNumber == 4)
  {
    pushMatrix();
      translate(earsX, earsY);
      antlers(0);
    popMatrix();
  }
  
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
void antlers(int depth)
{  
  // LOCAL VARIABLES
  float branchRot1 = random(0, 1);
  float branchRot2 = random(-1,1);
  float antlerWidth1 = random(20,50);
  float antlerWidth2 = random(30,80);
    
    
  pushStyle();
    // tree branch style
    strokeWeight( random (.5, 2) );
    stroke(randomC1-100,randomC2,randomC3);
    strokeCap(ROUND);
    
    // this is the tree trunk
    line(0,0,0,-antlerWidth2);
    
    // all recursive functions must have an exit condition
    // when the depth is less than 10, depth is 0
    if (depth < 8) 
    {
      pushMatrix(); // save the current state of the transformation
      translate(0,-antlerWidth1); // move the tree
      rotate(branchRot1); // then rotate the branches
      scale(.6); 
      antlers(depth+1);
      popMatrix();
      
      // height of tree
      pushMatrix(); // save the current state of the transformation
      translate(0,-antlerWidth2); // move the tree
      rotate(branchRot2); // then rotatet the branches
      scale(0.6);
      antlers(depth+1);
      popMatrix();
    }
  popStyle();
}
/*--------------------------------------------------------------------------------*/

}
