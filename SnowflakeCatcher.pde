
Snowflake [] snow;
int totalMoving;
int totalSnowFlakes = 50;
void setup()
{
  background(0); 
  size(800,800);
  snow = new Snowflake[500];
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
  if (totalMoving < 50) {
    totalSnowFlakes += 1;
    snow[totalSnowFlakes-1] = new Snowflake(true);
  }
  //your code here
}
void mouseDragged()
{
  stroke(0,155,155);
  strokeWeight(5);
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
      y = (int)(Math.random()*796);
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
      if(get(x,y+10) != color(0)) {
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
    if(y == 296) { 
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
