/*--------------------------------------------------------------------------------
GENERATES THE EARS/ANTLERS

CREDITS
  Tree code based off:
  - http://www.openprocessing.org/sketch/7150
  - http://processing.org/learning/topics/tree.html
--------------------------------------------------------------------------------*/
class ears extends body
{
  float headXref;
  float headYref;
  

/*--------------------------------------------------------------------------------*/
ears()
{
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
void drawMe(int rollNumber, float branchRot1, float branchRot2, float antlerWidth1, float antlerWidth2)
{ 
  //println(rollNumber);
  
  
  
  // TREE-LIKE ANTLERS, 2 SETS (3)
  if(rollNumber == 1)
  {
   // STRETCHY STRETCHY SQUASH
    if(body_location.y+body_shapeSize > height && switchDirection == false)
    {
    pushMatrix();
      translate(earsX-20, earsY);
      scale(1,.8);
      antlers(0, branchRot1, branchRot2, antlerWidth1, antlerWidth2);
    popMatrix();
    pushMatrix();
      translate(earsX+20, earsY);
      scale(-1,.8);
      antlers(0, branchRot1, branchRot2, antlerWidth1, antlerWidth2);
    popMatrix();     
    }
    else
    {
    pushMatrix();
      translate(earsX-20, earsY);
      antlers(0, branchRot1, branchRot2, antlerWidth1, antlerWidth2);
    popMatrix();
    pushMatrix();
      translate(earsX+20, earsY);
      scale(-1,1);
      antlers(0, branchRot1, branchRot2, antlerWidth1, antlerWidth2);
    popMatrix();
    }
  }
  
  
  
  // TREE-LIKE ANTLERS, 1 SET (4)
  else if(rollNumber == 2)
  {
    // STRETCHY STRETCHY SQUASH
    if(body_location.y+body_shapeSize > height && switchDirection == false)
    {
    pushMatrix();
      translate(earsX, earsY);
      scale(1,.8);
      antlers(0, branchRot1, branchRot2, antlerWidth1, antlerWidth2);
    popMatrix();      
    }
    else
    {
    pushMatrix();
      translate(earsX, earsY);
      antlers(0, branchRot1, branchRot2, antlerWidth1, antlerWidth2);
    popMatrix();
    }
  }
  
  
  
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
// TREE-LIKE ANTLERS
/*--------------------------------------------------------------------------------*/
void antlers(int depth, float branchRot1, float branchRot2, float antlerWidth1, float antlerWidth2)
{  
  pushStyle();
    // tree branch style
    strokeWeight(5);
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
      scale(0.6); 
      antlers(depth+1, branchRot1, branchRot2, antlerWidth1, antlerWidth2);
      popMatrix();
      
      // height of tree
      pushMatrix(); // save the current state of the transformation
      translate(0,-antlerWidth2); // move the tree
      rotate(branchRot2); // then rotatet the branches
      scale(0.6);
      antlers(depth+1, branchRot1, branchRot2, antlerWidth1, antlerWidth2);
      popMatrix();
    }
  popStyle();
}
/*--------------------------------------------------------------------------------*/

}
