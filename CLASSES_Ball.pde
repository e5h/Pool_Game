//Amount of balls
int ball_count = 10;

//Class for each individual pool ball

class Ball{ 
  float rad; //radius
  Point center; //center point (x, y)
  Point contact_point; //(it's secret)
  color col; //color value
  Velocity vel; //velocity (x, y)
  
  Ball(float x, float y, float r, int c1, int c2, int c3){
    center = new Point(x, y); 
    rad = r;
    col = color(c1, c2, c3);
    vel = new Velocity(0.0, 0.0); //initialized with 0 velocity
  }
  
  void draw_ball(){
     fill(col);
     ellipse(center.x, center.y, rad * 2, rad * 2);
  }
}