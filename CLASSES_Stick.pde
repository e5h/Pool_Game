//Class for the pool stick

class Stick{
  Point start_p;
  Point end_p;
  color col; //color of the pool stick
  int length; //length of the pool stick
  
  Stick(float sx, float sy, float ex, float ey, int c1, int c2, int c3, int len){
    start_p = new Point(sx, sy);
    end_p = new Point(ex, ey);
    col = color(c1, c2, c3);
    length = len;
  }
  
  void draw_stick(){ //for drawing the stick when the mouse is moving around
  
    //calculating the ratio between stick length and mouse distance (pythagoras)
    float x_sep = end_p.x - start_p.x; //finds the x value of the hypotenuse between the ball and mouse
    float y_sep = end_p.y - start_p.y; //finds the y value of the hypotenuse between the ball and mouse
    float hyp_sep = sqrt(pow(x_sep, 2) + pow(y_sep, 2)); //calculates the hypotenuse
    float hyp_ratio = length / hyp_sep; //the ratio is used to scale the x and y values of the stick
    float cue_ratio = (table.cue_ball.rad + 7) / hyp_sep;
    
    //determining the stick start point
    float p1_x = (x_sep * cue_ratio) + start_p.x; //value of the x sep times the cue ball ratio
    float p1_y = (y_sep * cue_ratio) + start_p.y; //value of the y sep times the cue ball ratio
                                                  //...This creates the vector for the stick end

    //determining the stick end point
    float p2_x = (x_sep * hyp_ratio) + start_p.x; //value of the x sep times the hypotenuse ratio
    float p2_y = (y_sep * hyp_ratio) + start_p.y; //value of the y sep times the hypotenuse ratio
                                                  //...This creates the vector for the stick end.
    
    //outline:
    stroke(0);
    strokeWeight(9);
    line(p1_x, p1_y, p2_x, p2_y);
    
    //stick:
    stroke(col);
    strokeWeight(5);
    line(p1_x, p1_y, p2_x, p2_y);
  }
}