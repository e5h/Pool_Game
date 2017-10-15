//MAIN FUNCTION:
//FOR IDLING

void draw_idle(){
  
  if(no_movement()){
  
    //set the background color
    background(0, 50, 125);
  
    //sets stick end point to cue ball location
    table.st.start_p.x = table.cue_ball.center.x;
    table.st.start_p.y = table.cue_ball.center.y;
  
    //sets stick start location to mouse location
    table.st.end_p.x = mouseX;
    table.st.end_p.y = mouseY;
  
    //functions to draw the basics
    table.draw_table();
    table.draw_balls();
    table.cue_ball.draw_ball();
    table.st.draw_stick();
    draw_shot_power(mouseX, mouseY);
  
  }
  else{
    
    //set the background color
    background(0, 50, 125);
    
    //CUE BALL
    //takes the current point and adds the velocity
    table.cue_ball.center.x += table.cue_ball.vel.x;
    table.cue_ball.center.y += table.cue_ball.vel.y;
    
    //slowly reduce the shot velocity
    table.cue_ball.vel.x *= 0.99;
    table.cue_ball.vel.y *= 0.99;
    
    //OTHER BALLS
    for(int i = 0; i < table.b_arr.length; i++){
      
      //takes current point and adds velocity
      table.b_arr[i].center.x += table.b_arr[i].vel.x;
      table.b_arr[i].center.y += table.b_arr[i].vel.y;
      
      //slowly reduce the shot velocity
      table.b_arr[i].vel.x *= 0.99;
      table.b_arr[i].vel.y *= 0.99;
    }
    
    //basic drawing functions (no stick)
    table.draw_table();
    table.draw_balls();
    table.cue_ball.draw_ball();
    
    //check if the cue ball hit anything
    check_collisions(table.cue_ball);
    
    //check if the other balls hit anything
    for(int i = 0; i < table.b_arr.length; i++){
      check_collisions(table.b_arr[i]);
    }
    
  }
  
}