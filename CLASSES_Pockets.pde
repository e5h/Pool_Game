//Pockets for checking collisions
Float pocket_r = 25.0;
Pocket [] table_pockets = new Pocket[6];

//Class for each pool ball pocket

class Pocket{
  float x; //x location
  float y; //y location
  float rad; //radius
  float sp; //start angle of the arc
  float ep; //end angle of the arc
  
  Pocket(float x_pos, float y_pos, float radius, float start_point, float end_point){
    x = x_pos;
    y = y_pos;
    rad = radius;
    sp = start_point;
    ep = end_point;
  }
  
  //basic function to draw the pocket
  void draw_pocket(){
    arc(x, y, rad*2, rad*2, radians(sp), radians(ep));
  }
}