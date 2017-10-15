//Overall power scaling
Float pwr_scale_factor = 6.0;

//MAIN FUNCTION:
//FOR SHOOTING

void mouseClicked(){
  
  if(game_state == 0){//if the game is in idle mode
    
    if(no_movement()){
    
      //play the cue hit sound
      cue_hit.play();
      cue_hit.rewind();
  
      //visualize a right triangle for x/y vectors
      float x_cmp = mouseX - table.cue_ball.center.x;
      float y_cmp = mouseY - table.cue_ball.center.y;
      float hyp = sqrt(pow(x_cmp, 2) + pow(y_cmp, 2));
  
      //determine the x/y ratios
      float x_rat = x_cmp / hyp;
      float y_rat = y_cmp / hyp;
  
      //set the velocities
      table.cue_ball.vel.x = shot_power * x_rat * pwr_scale_factor * -1; 
      table.cue_ball.vel.y = shot_power * y_rat * pwr_scale_factor * -1;

    }
  }
  else{ //if the game is in fail / win mode
    new_table();
  }
}