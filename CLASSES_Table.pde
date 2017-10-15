//Class for the overall table, encompasses everything

//pepe (image)
PImage pepe;

class Table{
  Ball [] b_arr; //the length of this array can be 1 for
  Ball cue_ball; //iteration 3
  Stick st;
  int score;
  int timer_len;
  int start_time;
  int current_time;
  
  Table(Ball [] arr, Ball cue, Stick s){
    b_arr = arr;
    cue_ball = cue;
    st = s;
    score = 0;
  }
  
  //keeps the time
  int timer(int timer_length){ 
    int remaining_time = timer_length - (millis() - start_time); //time minus the milliseconds
                                                                //written this way so it can reset when the table does
    
    if(remaining_time/1000 <= 0){ //divided by 1000 to get seconds
      game_state = 1;             //if theres no time left, fail the game.
    }
    return remaining_time/1000;
  }
  
  void draw_table(){
      stroke(0); //Black borders:
      strokeWeight(4); //Larger outline:
      
      //black instructional text
      fill(0);
      textSize(20);
      text("Use scroll wheel to change shot power, and click either mouse button to shoot!", 300, 30);
  
      //Brown barriers of the pool table:
      fill(102, 51, 0); //Brown fill;
      rect(50, 50, 1300, 700, 25);
  
      strokeWeight(2); //Thinner outline:
  
      //Green base of the pool table:
      fill(76, 129, 59); //Green fill:
      rect(100, 100, 1200, 600);
      
      //draw pepe
      image(pepe, 500, 200);
  
      //Pockets for the pool balls
       fill(0); //Black fill:
       for(int i = 0; i < table_pockets.length; i++){
         table_pockets[i].draw_pocket();
       }
  
      //Outline for the arcs:
      noFill();
      rect(100, 100, 1200, 600);   
      
      //Draw the score visually:
      fill(0, 255, 255);
      textSize(30);
      text("Score: " + score, 200, 85);
      text("Time Remaining: " + timer(timer_len) + "s", 500, 85);
  }
  
  void draw_balls(){ //draws each ball in the array
   for(int i = 0; i < b_arr.length; i++){
     table.b_arr[i].draw_ball();
   }
  }
}