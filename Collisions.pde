//MAIN FUNCTION:
//CHECKS BALL COLLISIONS FOR A GIVEN BALL

void check_collisions(Ball ball){
  
    //CHECK X WALL COLLISIONS
    if(ball.center.x <= (100 + ball.rad) || ball.center.x >= (1300 - ball.rad)){
      
      ball.vel.x *= -1; //change the velocity
      
      wall_hit.play(); //play the wall hit sound
      wall_hit.rewind(); //
      
      //extra measure: change the position itself.
      if(ball.center.x <= 100 + ball.rad){
        ball.center.x = 101 + ball.rad;
      }
      else{
        ball.center.x = 1299 - ball.rad;
      }
      
    }
    
    //CHECK Y WALL COLLISIONS
    if(ball.center.y <= (100  + ball.rad) || ball.center.y >= (700 - ball.rad)){
      
      ball.vel.y *= -1; //change the velocity
      
      wall_hit.play(); //play the wall hit sound
      wall_hit.rewind(); //
      
       //extra measure: change the position itself.
      if(ball.center.y <= 100 + ball.rad){
        ball.center.y = 101 + ball.rad;
      }
      else{
        ball.center.y = 699 - ball.rad;
      }
    }
    
    //CHECK POCKET COLLISIONS
    for(int i = 0; i < table_pockets.length; i++){
      float x_sep = table_pockets[i].x - ball.center.x;
      float y_sep = table_pockets[i].y - ball.center.y;
      float hyp = sqrt(pow(x_sep, 2) + pow(y_sep, 2));
      
      if(hyp < table_pockets[i].rad){ //if it hit the pocket
        
        if(ball == table.cue_ball){ //if its the cue ball
          game_state = 1; //lmao scrub
          
          //add some spice
          bobsaget.play();
          bobsaget.rewind();
        }
        else{                       //if its a regular ball
        
          if(ball.rad != 0){
            
          table.score += 1;
          removeBall(ball); //need to work on this function
          
          if(table.score == table.b_arr.length){
          game_state = 2;
          
          //add some spice
          smd.play();
          smd.rewind();
          
          }
          
          }
        }
        
      }
  
   }
   
   //CHECK BALL COLLISIONS
   for(int i = 0; i < table.b_arr.length; i++){
     
     if(table.b_arr[i] != ball){
     
     float x_sep = table.b_arr[i].center.x - ball.center.x;
     float y_sep = table.b_arr[i].center.y - ball.center.y;
     float hyp = sqrt(pow(x_sep, 2) + pow(y_sep, 2));
     float x_rat = x_sep/hyp;
     float y_rat = y_sep/hyp;
     
     if(table.b_arr[i].rad != 0){
      
      if(hyp < 2 * ball.rad){
        //Apply a ball to ball collision
        
        //play sound
        ball_hit.play();
        ball_hit.rewind();
        
        //Ball 1 = parent ball
        //Ball 2 = loop ball
        float p1x = ball.center.x;
        float p1y = ball.center.y;
        float p2x = table.b_arr[i].center.x;
        float p2y = table.b_arr[i].center.y;
        
        float v1x = ball.vel.x;
        float v1y = ball.vel.y;
        float v2x = table.b_arr[i].vel.x;
        float v2y = table.b_arr[i].vel.y;
        
        float dx = (p1x - p2x);
        float dy = (p1y - p2y);
        
        float k = ((v1x - v2x)*(p1x - p2x) + (v1y - v2y)*(p1y - p2y))/
                  //--------------------------------------------------
                       (pow((p1x - p2x), 2) + pow((p1y - p2y), 2));
                       
        //Set the velocities
        //This is retrieved from D2L.
        
        ball.vel.x = v1x - k*dx;
        ball.vel.y = v1y - k*dy;
        table.b_arr[i].vel.x = v2x + k*dx;
        table.b_arr[i].vel.y = v2y + k*dy;
        
        //Set the positions to prevent sticking
        //(sets balls 1 pixel apart after they collide)
        
        ball.center.x = table.b_arr[i].center.x - (x_rat * (2 * ball.rad + 1));
        ball.center.y = table.b_arr[i].center.y - (y_rat * (2 * ball.rad + 1));
        
        }
     }
     }
   }
   
}