/*--------------------------------------------------------------------------------
MONSTER GENERATOR
  Interactive Art & Computational Design
  M. Yvonne Hidle (yvonnehidle@gmail.com)
--------------------------------------------------------------------------------*/




/*--------------------------------------------------------------------------------*/
// ALL OUR GLOBAL VARIABLES ARE HERE
/*--------------------------------------------------------------------------------*/ 
// MY IMAGES
  PImage bg;
  

// IS THE MOUSE OVER THE CRITTER
  boolean overCritter = false;
  boolean locked = false;
  float xOffset = 0.0; 
  float yOffset = 0.0; 


// CRITTER VARIABLES
// gravity, wind, and life bitches
  PVector wind;
  PVector gravity;
// control the position of the body
  body myBody;
  PVector body_location;
  PVector body_velocity;
  float body_numPoints;
  float body_noiseFactor;
  float body_shapeSize;
  float body_fluff; 
// control the position of the eyes
  eyes myEyes;
  float eyesX;
  float eyesY;
  float eyes_n1;
  float eyes_n2;
  int eyes_rollNumber;
// control the position of the ears
  ears myEars;
  int ears_rollNumber;
  float earsX;
  float earsY;
  float ears_branchRot1;
  float ears_branchRot2;
  float ears_antlerWidth1;
  float ears_antlerWidth2;
    
// roll a random color
  int randomC1;
  int randomC2;
  int randomC3;
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
void setup() 
{    
  size(800, 600);
  smooth();
  frameRate(20);
  
  
  // IMAGES
  bg = loadImage("paperbg.png");
  
  
  // BODY PART VARIABLES
  // gravity, wind, and life bitches
    wind = new PVector(0.01,0);
    gravity = new PVector(0,0.1);
  // body
    myBody = new body();
    body_location = new PVector(width/2,height/2);
    body_velocity = new PVector(0,0);
    body_numPoints = 3000;
    body_noiseFactor = 10;
    body_shapeSize = int( random(60,80) );
    body_fluff = 10; 
  // eyes
    myEyes = new eyes();
    eyesX = body_location.x;
    eyesY = body_location.y-10;
    eyes_n1 = random(20,30);
    eyes_n2 = random(35,50);
    eyes_rollNumber = int( random(1,5) );
  // ears
    myEars = new ears();
    ears_rollNumber = int( random(1,2) );
    earsX = body_location.x-10;
    earsY = body_location.y-40;
    ears_branchRot1 = random(0, 1);
    ears_branchRot2 = random(-1,1);
    ears_antlerWidth1 = random(20,50);
    ears_antlerWidth2 = random(30,80);
    
    
    
    
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
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
void draw() 
{
  background(bg);
 
  // IS THE MOUSE OVER THE CRITTER?
  if (mouseX > body_location.x-body_shapeSize && mouseX < body_location.x+body_shapeSize && mouseY > body_location.y-body_shapeSize && mouseY < body_location.y+body_shapeSize)
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


  // DRAW MONSTER
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
  // CRITTER BODY MOVEMENT
  myBody.applyForce(wind);
  myBody.applyForce(gravity);
  myBody.update();
  myBody.checkEdges(body_shapeSize);


  // DRAW MONSTER PARTS
  myEars.drawMe(ears_rollNumber, ears_branchRot1, ears_branchRot2, ears_antlerWidth1, ears_antlerWidth2);
  myBody.drawMe(body_numPoints, body_noiseFactor, body_shapeSize, body_fluff);
  myEyes.drawMe(eyes_n1, eyes_n2, eyes_rollNumber);
  
  
  // ATTACH BODY PARTS TO THE CRITTER
  // eyes
    eyesX = body_location.x;
    eyesY = body_location.y-10;
  // ears
    earsX = body_location.x-10;
    earsY = body_location.y-40;
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
  
  xOffset = mouseX-body_location.x; 
  yOffset = mouseY-body_location.y; 
}




void mouseDragged() 
{
  if(locked == true) 
  {
    
    // LOCK ALL BODY PARTS
    // body
      body_location.x = mouseX-xOffset; 
      body_location.y = mouseY-yOffset; 
      body_fluff = 0; 
    // eyes
      eyesX = body_location.x;
      eyesY = body_location.y-10;
  }
}




void mouseReleased() 
{
  locked = false;
  body_fluff = 10; 
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
  if(randomC1>200 && randomC2>200 && randomC3>200)
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
  // body
    body_shapeSize = int( random(60,80) );
  // eyes
    eyes_n1 = random(20,30);
    eyes_n2 = random(35,50);
    eyes_rollNumber = int( random(1,5) );
  // ears
    ears_rollNumber = int( random(1,2) );
    ears_branchRot1 = random(0, 1);
    ears_branchRot2 = random(-1,1);
    ears_antlerWidth1 = random(20,50);
    ears_antlerWidth2 = random(30,80);
}
/*--------------------------------------------------------------------------------*/
