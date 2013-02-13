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
  println(rollNumber);
  

  
  // CIRCLE EARS (1)
  if(rollNumber == 1)
  {
    circleEars();
  }
  
  // RECTANGLE EARS (2)
  if(rollNumber == 2)
  {
    squareEars();
  }
  
  // TREE-LIKE ANTLERS, 2 SETS (3)
  else if(rollNumber == 3)
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
  else if(rollNumber == 4)
  {
    pushMatrix();
      translate(earsX, earsY);
      antlers(0);
    popMatrix();
  }
  
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
// CIRCLE EARS
/*--------------------------------------------------------------------------------*/
void circleEars()
{
  // RANDOM VARIABLES
  // we want the start point to be 0,0 inside the body
    float x1 = 0;
    float y1 = 0;
  // all the x values
    float x2 = random(0,30);
    float x3 = random(-10,30);
    float x4 = random(-20,30);
    float x2b = random(0,20);
    float x3b = random(-5,35);
    float x4b = random(-25,35);
  // all the y values
    float y2 = 0;
    float y3 = random(-120,-200);
    float y4 = random(-220,-250);
    float y3b = random(-115,-210);
    float y4b = random(-230,-240);
  // this is for the circle ear parts
    float n1 = random(10,20);
    float n2 = random(20,25);
    
    
    
    // THE EAR IS HERE
    pushStyle();
        pushMatrix();
          translate(earsX-20, earsY);
          // EAR ATTACHMENT
          noFill();
          strokeWeight(2);
          stroke(randomC1-100,randomC2,randomC3);
          curve(x1, y1, x2, y2, x3, y3, x4, y4);
          
          // EAR TIP
          noStroke();
          fill(randomC1-100,randomC2,randomC3);
          ellipse(x3,y3,n1,n2);
        popMatrix();
        
        pushMatrix();
          translate(earsX+20, earsY);
          scale(-1,1);
          // EAR ATTACHMENT
          noFill();
          strokeWeight(2);
          stroke(randomC1-100,randomC2,randomC3);
          curve(x1, y1, x2b, y2, x3b, y3b, x4b, y4b);
          
          // EAR TIP
          noStroke();
          fill(randomC1-100,randomC2,randomC3);
          ellipse(x3b,y3b,n1,n2);
        popMatrix();
      popStyle();
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
// RECTANGLE/SQUARE EARS
/*--------------------------------------------------------------------------------*/
void squareEars()
{
    float n1 = random(15,20);
    float n2 = random(65,100);
    
    pushStyle();
      pushMatrix();
        translate(earsX-20, earsY-50);
        rectMode(CORNER);
        noStroke();
        fill(randomC1-50,randomC2,randomC3);
        rect(0,0,n1,n2);
        
        fill(randomC1-100,randomC2-100,randomC3);
        rect(n1/4, 5, n1/2, n2);
      popMatrix();
    popStyle();
      
    pushStyle();
      pushMatrix();
        translate(earsX+20, earsY-50);
        rectMode(CORNER);
        noStroke();
        fill(randomC1-50,randomC2,randomC3);
        rect(0,0,n1,n2);
        
        fill(randomC1-100,randomC2-100,randomC3);
        rect(n1/4, 5, n1/2, n2);
      popMatrix();
    popStyle();
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
// TREE-LIKE ANTLERS
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
