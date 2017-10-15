//Class for the 2D XY vector of the ball
class Point{
  float x, y; //stores x and y coordinates
  Point (float a, float b){
    x = a;
    y = b;
  }
}

//class to store the velocities
class Velocity{
  float x; //x component
  float y; //y component
  Velocity(float x_velocity, float y_velocity){
    x = x_velocity;
    y = y_velocity;
  }
}