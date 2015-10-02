
Snowflake [] snow;
int totalMoving;
int totalSnowFlakes = 100;
void setup()
{
  background(0); 
  size(800,800);
  snow = new Snowflake[100];
  for(int i = 0; i < totalSnowFlakes; i++) {
    snow[i] = new Snowflake(false);
  }
  //your code here
}
void draw()
{  
  totalMoving = 0;
  for (int i = 0; i < totalSnowFlakes; i++){
    snow[i].erase();
    snow[i].lookDown();
    snow[i].move();
    snow[i].wrap();
    snow[i].show();
    snow[i].checkMoving();
  }
  if (totalMoving < 100) {
    totalSnowFlakes += 1;
    snow[totalSnowFlakes-1] = new Snowflake(true);
  }
  //your code here
}
void mouseDragged()
{
  stroke(255,153,0);
  strokeWeight(3);
  line(pmouseX,pmouseY,mouseX,mouseY);
  strokeWeight(1);
  stroke(0);
  //your code here
}

class Snowflake
{
  int x;
  int y;
  boolean isMoving;
  boolean startTop;
  //class member variable declarations
  Snowflake(boolean inputstartTop)
  {
    x = (int)(Math.random()*800);
    if (inputstartTop == true) {
      y = 0;
    }
    else {
      y = (int)(Math.random()*800);
    }
    isMoving = true;
    //class member variable initializations
  }
  void show()
  {

    fill(255);
    ellipse(x,y,7,7);
    //your code here
  }
  void lookDown()
  {
    if (y > 0 && y < 800) {
      if(get(x,y+4) != color(0)) {
        isMoving = false;
      }
      else {
        isMoving = true;
      }
    }
    //your code here
  }
  void erase()
  {
    fill(0);
    ellipse(x,y,7,7);
    //your code here
  }
  void move()
  {
    if(isMoving == true){
      y += 1;
    }
    //your code here
  }
  void wrap()
  {
    if(y == 796) { 
      y = 0;
      x = (int)(Math.random()*800);
    }
    //your code here
  }

  void checkMoving()
  {
    if(isMoving == true) {
      totalMoving+= 1;
    }
  }
}
