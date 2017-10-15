//checks if balls are moving

Boolean no_movement(){
  
  Boolean no_cue_movement = false; //assumed to be moving, proves otherwise
  Boolean no_ball_movement = true; //assumed to be stopped, easier for a
                                   //loop to determine if one is false, rather
                                   //than if all are true.
  
  //Check if the cue ball is not moving
   if(abs(table.cue_ball.vel.x) < 0.1 && abs(table.cue_ball.vel.y) < 0.1){ //larger values means it stops faster
   
     no_cue_movement = true; //cue ball is not moving
     
     table.cue_ball.vel.x = 0.0; //make the cue ball stop
     table.cue_ball.vel.y = 0.0; //
   }
    
   //Check if any other ball is moving
   for(int i = 0; i < table.b_arr.length; i++){
      if(abs(table.b_arr[i].vel.x) > 0.1 && abs(table.b_arr[i].vel.y) > 0.1){
        no_ball_movement = false;
      }
      else{
        table.b_arr[i].vel.x = 0.0;//make the ball stop
        table.b_arr[i].vel.y = 0.0;//
      }
   }
   
   if(no_cue_movement == true && no_ball_movement == true){ //if nothing is moving
     return true; //return true
   }
   else{
     return false; //otherwise, return false
   }
}