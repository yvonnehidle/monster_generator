/*--------------------------------------------------------------------------------
MONSTER GENERATOR
  Interactive Art & Computational Design
  M. Yvonne Hidle (yvonnehidle@gmail.com)
--------------------------------------------------------------------------------*/




/*--------------------------------------------------------------------------------*/
// MY CLASSES
head myHead;
eyes myEyes;
body myBody;
ears myEars;
tail myTail;
legs myLegs;

// GLOBAL VARIABLES
// control the position of the body
  float bodyX = 280;
  float bodyY = 250;
// control the position of the head
  float headX = bodyX-100;
  float headY = bodyY-80;
// control the position of the eyes
  float eyesX = headX-15;
  float eyesY = headY-10;
// control the position of the ears
  float earsX = headX-10;
  float earsY = headY-10;
// control the position of the tail
  float tailX = bodyX;
  float tailY = bodyY;
// control the position of the legs
  float legX = bodyX;
  float legY = bodyY;

// roll a random color
int randomC1;
int randomC2;
int randomC3;
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
void setup() 
{
  background(255);
  size(600, 450, P2D);
  smooth();
  
  // classes
  myHead = new head();
  myEyes = new eyes();
  myBody = new body();
  myEars = new ears();
  myTail = new tail();
  myLegs = new legs();
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
void draw() 
{
  // GENERATE MONSTER COLORS
  randomC1 = int( random(0,300) );
  randomC2 = int( random(0,300) );
  randomC3 = int( random(0,300) );
  
  // we don't want white so please reroll
  if(randomC1>230 && randomC2>230 && randomC3>230)
  {
    randomC1 = int( random(0,300) );
    randomC2 = int( random(0,300) );
    randomC3 = int( random(0,300) );
  }
  
  // we don't want black so please reroll
  if(randomC1<20 && randomC2<20 && randomC3<20)
  {
    randomC1 = int( random(0,300) );
    randomC2 = int( random(0,300) );
    randomC3 = int( random(0,300) );
  }
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
void mousePressed()
{  
  // GENERATE RANDOM VARIABLES
  // head
    float head_numPoints = random(10, 300);
    float head_noiseFactor = random(0, 5);
    float head_shapeSize = random(20,35);
  // body
    float body_numPoints = random(10, 300);
    float body_noiseFactor = random(0, 5);
    float body_shapeSize = random(50,65);
  // eyes
    float eyes_n1 = random(5,15);
    float eyes_n2 = random(3,18);
    int eyes_rollNumber = int( random(1,5) );
  
  
  // DRAW MONSTER PARTS
  background(255);
  myBody.drawMe(body_numPoints, body_noiseFactor, body_shapeSize);
  myHead.drawMe(head_numPoints, head_noiseFactor, head_shapeSize);
  myEyes.drawMe(eyes_n1, eyes_n2, eyes_rollNumber);
  
  pushMatrix();
    filter(GRAY);
    filter(BLUR,2);
    translate(-2,-2);
    myEars.drawMe();
    //myTail.drawMe();
    myLegs.drawMe();
    myBody.drawMe(body_numPoints, body_noiseFactor, body_shapeSize);
    myHead.drawMe(head_numPoints, head_noiseFactor, head_shapeSize);
    myEyes.drawMe(eyes_n1, eyes_n2, eyes_rollNumber);
  popMatrix();
  
  
  // FOR MY REFERENCE
//  pushStyle();
//    noFill();
//    stroke(0);
//    strokeWeight(5);
//    point(bodyX,bodyY);
//    point(headX,headY);
//    point(eyesX,eyesY);
//    point(earsX,earsY);
//    point(tailX,tailY);
//    point(legX,legY);
//  popStyle();
}
/*--------------------------------------------------------------------------------*/
