/*--------------------------------------------------------------------------------
GENERATES THE BODY

CREDITS
  Noise code based off:
  - https://forum.processing.org/topic/how-to-make-perlin-noise-loop
--------------------------------------------------------------------------------*/
class body
{

PVector acceleration;
float mass;
boolean switchDirection;
float stretchFactorY;
  

/*--------------------------------------------------------------------------------*/
body()
{
  acceleration = new PVector(0,0);
  mass = 1;
  switchDirection = false;
  stretchFactorY = 1;
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
// APPLY A FORCE, I.E. GRAVITY OR WIND
/*--------------------------------------------------------------------------------*/
// APPLY A FORCE
void applyForce(PVector force) 
{
    if(locked == false)
    {
      PVector f = PVector.div(force,mass);
      acceleration.add(f);
    }
}


// UPDATE
void update() 
{
    if(locked == false)
    {
      body_velocity.add(acceleration);
      body_location.add(body_velocity);
      acceleration.mult(0);
    }


// CHECK FOR PROBLEMS
//println(acceleration);
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
// KEEP THE BODY ON THE SCREEN
/*--------------------------------------------------------------------------------*/
void checkEdges(float shapeSize)
{
  // BOUNCE BOUNCE BOUNCE
  // if critter is too far right
  if(body_location.x+shapeSize > width) 
  {
    body_location.x = width-shapeSize;
    body_velocity.x *= -1;
  }
  // if critter is too far left
  else if(body_location.x-shapeSize < 0) 
  {
    body_location.x = 0+shapeSize;
    body_velocity.x *= -1;
  }
  
  
  
  // if critter is too far down
  if(body_location.y+shapeSize > height) 
  {
    //body_location.y = height-shapeSize;
    body_velocity.y *= .9;
    //println("condition 1");

     if(body_location.y+shapeSize/2 > height && switchDirection == false)
      {
        //body_location.y = body_location.y+shapeSize/1.5;
        body_velocity.y *= -1;
        switchDirection = true;
        //println("condition 2");
      }
      
      else if(body_location.y+shapeSize/2 < height)
      {
        body_velocity.y *= 1.11111111111111;
        //println("condition 3");
      }
  }
  
  else if(body_location.y+shapeSize > height-30)
  {
    switchDirection = false;
  }
  
  
  
  // if critter is too far up
  else if(body_location.y-shapeSize < 0)
  {
    body_location.y = 0+shapeSize;
    body_velocity.y *= -1;
  }
  
  //println(body_velocity.y);
  //print(switchDirection + " ");
}
/*--------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------*/
// DRAW THE BODY HERE
/*--------------------------------------------------------------------------------*/
void drawMe(float numPoints, float noiseFactor, float shapeSize, float fluff)
{ 
  // LOCAL VARIABLES
  // variables that don't change
  float rot = radians(360)/numPoints;
  float innerRadZero = 0;
  float outerRad = 50;
  float stretchFactorX = 1;
  
  
  // STRETCHY STRETCHY SQUASH
  if(body_location.y+shapeSize > height && switchDirection == false)
  {
    //stretchFactorY = stretchFactorY - 0.005;
    //stretchFactorY = (0.1*body_velocity.y)/stretchFactorY;
    stretchFactorY = stretchFactorY - (abs(body_velocity.y)/stretchFactorY/200);
    //stretchFactorY = stretchFactorY - ( abs( sqrt(body_velocity.y)/10 ) );
  }
  else if(body_location.y+shapeSize > height && switchDirection == true && stretchFactorY < 1)
  {
    //stretchFactorY = stretchFactorY + 0.005;
    //stretchFactorY = stretchFactorY + abs(0.005*body_velocity.y);
    stretchFactorY = stretchFactorY + (abs(body_velocity.y)/stretchFactorY/200);
    //stretchFactorY = stretchFactorY + ( abs( sqrt(body_velocity.y)/10 ) );
  }
  println(body_velocity.y + " || " + stretchFactorY);


  // BEGIN DRAWING THE BODY HERE
  pushMatrix();
  pushStyle();
  
  // move head to correct position
  translate(body_location.x, body_location.y);
  
  // color and stroke
  noStroke();
  fill(randomC1,randomC2,randomC3);
  
  // draw shape of head
  beginShape();
  
      for (int i=0; i<numPoints; i++) 
      {
        float angle = i*rot;
        float x = sin(angle);
        float y = cos(angle);
        float innerRad = shapeSize + noise(i*noiseFactor, frameCount*0.01) * shapeSize;
        if (i == 0) 
        {
          innerRadZero = innerRad;
        } 
        else if (i>numPoints*fluff) 
        {
          float perc = map(i, numPoints*fluff, numPoints, 0, 1);
          innerRad = lerp(innerRad, innerRadZero, perc);
        }

        // draw the vertex to form the body
        vertex(x*innerRad*stretchFactorX, y*innerRad*stretchFactorY);
      }
  endShape(CLOSE);
  
  popStyle();
  popMatrix();
  
  
  // CHECK FOR PROBLEMS
  //println("stretchFactorY: "+stretchFactorY);
  //println("stretchFactorX: "+stretchFactorX);
  //println("locationX: " + body_location.x + " velocityX: " + body_velocity.x);
  //println("locationY: " + body_location.y + " ||| velocityY: " + body_velocity.y);
  //println(shapeSize + " || " + stretchFactorY + " || " + body_velocity.y + " || " + body_location.y);
}
/*--------------------------------------------------------------------------------*/

}
