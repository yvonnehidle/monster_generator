/*--------------------------------------------------------------------------------
MONSTER GENERATOR
  Interactive Art & Computational Design
  M. Yvonne Hidle (yvonnehidle@gmail.com)
--------------------------------------------------------------------------------*/




/*--------------------------------------------------------------------------------*/
// ALL OUR GLOBAL VARIABLES ARE HERE
/*--------------------------------------------------------------------------------*/
// MY CLASSES
  head myHead;
  eyes myEyes;
  body myBody;
  ears myEars;
  tail myTail;
  legs myLegs;
  
  
// MY IMAGES
  PImage bg;
  

// IS THE MOUSE OVER THE CRITTER
  boolean overCritter = false;
  boolean locked = false;
  float xOffset = 0.0; 
  float yOffset = 0.0; 


// CRITTER VARIABLES
// control the position of the body
  float bodyX;
  float bodyY;
// control the position of the head
  float headX;
  float headY;
// control the position of the eyes
  float eyesX;
  float eyesY;
// control the position of the ears
  float earsX;
  float earsY;
// control the position of the tail
  float tailX;
  float tailY;
// control the position of the legs
  float legX;
  float legY;
  
// roll a random color
  int randomC1;
  int randomC2;
  int randomC3;
  
// random head variables
  float head_numPoints;
  float head_noiseFactor;
  float head_shapeSize;
// random body variables
  float body_numPoints;
  float body_noiseFactor;
  float body_shapeSize;
// random eye variables
  float eyes_n1;
  float eyes_n2;
  int eyes_rollNumber;
  
// roll a random number what type of ears
  int ears_rollNumber = int( random(1,5) );
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
void setup() 
{    
  size(800, 600);
  smooth();
  frameRate(60);
  
  
  // IMAGES
  bg = loadImage("paperbg.png");
  
  
  // CLASSES
  myHead = new head();
  myEyes = new eyes();
  myBody = new body();
  myEars = new ears();
  myTail = new tail();
  myLegs = new legs();
  
  
  // POSITION OF CRITTER BODY PARTS
  // control the position of the body
    bodyX = 280;
    bodyY = 250;
  // control the position of the head
    headX = bodyX-100;
    headY = bodyY-80;
  // control the position of the eyes
    eyesX = headX-15;
    eyesY = headY-10;
  // control the position of the ears
    earsX = headX-10;
    earsY = headY-10;
  // control the position of the tail
    tailX = bodyX;
    tailY = bodyY;
  // control the position of the legs
    legX = bodyX;
    legY = bodyY;
    
  
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
  if(randomC1<30 && randomC2<30 && randomC3<30)
  {
    randomC1 = int( random(0,300) );
    randomC2 = int( random(0,300) );
    randomC3 = int( random(0,300) );
  }
  
  
  // GENERATE RANDOM VARIABLES
  // head
    head_numPoints = 3000;
    head_noiseFactor = 1;
    head_shapeSize = random(40,60);
  // body
    body_numPoints = 3000;
    body_noiseFactor = 1;
    body_shapeSize = random(80,100);
  // eyes
    eyes_n1 = random(5,15);
    eyes_n2 = random(3,18);
    eyes_rollNumber = int( random(1,5) );
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
void draw() 
{
  background(bg);
 
  // IS THE MOUSE OVER THE CRITTER?
  if (mouseX > bodyX-body_shapeSize && mouseX < bodyX+body_shapeSize && mouseY > bodyY-body_shapeSize && mouseY < bodyY+body_shapeSize)
  {
    overCritter = true;  
    if(!locked) 
    { 
    } 
  }
  else 
  {
    overCritter = false;
  }
  //println(overCritter);


  // DRAW OUR CRITTER
  drawMonster();
  
  
  // GENERATE A NEW CRITTER WHEN YOU PRESS "R"
  if (keyPressed==true)
  {
    if (key =='r')
    {
      generateNew();
    }
  }
  
  
  // SHOW FRAMERATE
  pushStyle();
    textSize(12);
    stroke(0);
    fill(0);
    text(frameRate, 20,20);
  popStyle();
  
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
void drawMonster()
{  
  // DRAW MONSTER PARTS
    //myEars.drawMe(ears_rollNumber);
    //myTail.drawMe();
    //myLegs.drawMe();
    myBody.drawMe(body_numPoints, body_noiseFactor, body_shapeSize);
    myHead.drawMe(head_numPoints, head_noiseFactor, head_shapeSize);
    myEyes.drawMe(eyes_n1, eyes_n2, eyes_rollNumber);
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
// USE THE MOUSE TO MOVE THE CRITTER
/*--------------------------------------------------------------------------------*/
void mousePressed()
{
  // PICK UP OUR CRITTER
  if(overCritter == true) 
  { 
    locked = true; 
  } 
  
  else 
  {
    locked = false;
  }
  
  xOffset = mouseX-bodyX; 
  yOffset = mouseY-bodyY; 
}


void mouseDragged() 
{
  if(locked == true) 
  {
    // control the position of the body
      bodyX = mouseX-xOffset; 
      bodyY = mouseY-yOffset; 
    // control the position of the head
      headX = bodyX-100;
      headY = bodyY-80;
    // control the position of the eyes
      eyesX = headX-15;
      eyesY = headY-10;
    // control the position of the ears
      earsX = headX-10;
      earsY = headY-10;
    // control the position of the tail
      tailX = bodyX;
      tailY = bodyY;
    // control the position of the legs
      legX = bodyX;
      legY = bodyY;
  }
}


void mouseReleased() 
{
  locked = false;
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
// WHEN YOU PRESS ANY KEY, RESET THE VARIABLES
// GENERATE A DIFFERENT CRITTER
/*--------------------------------------------------------------------------------*/
void generateNew()
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
  if(randomC1<30 && randomC2<30 && randomC3<30)
  {
    randomC1 = int( random(0,300) );
    randomC2 = int( random(0,300) );
    randomC3 = int( random(0,300) );
  }


  // GENERATE RANDOM VARIABLES
  // head
    head_shapeSize = random(40,60);
  // body
    body_shapeSize = random(80,100);
  // eyes
    eyes_n1 = random(5,15);
    eyes_n2 = random(3,18);
    eyes_rollNumber = int( random(1,5) );
    
    
    // ROLL NUMBER TO DETERMINE EARS
    ears_rollNumber = int( random(1,5) );
}
/*--------------------------------------------------------------------------------*/
