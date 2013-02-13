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
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
void mousePressed()
{  
  // DRAW MONSTER PARTS
  background(255);
  myEars.drawMe();
  myTail.drawMe();
  myBody.drawMe();
  myHead.drawMe();
  myEyes.drawMe();
}
/*--------------------------------------------------------------------------------*/
