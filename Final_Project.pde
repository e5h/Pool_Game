//___________________________________________________________________________________________________________________
//LIBRARIES

  //sound
  import ddf.minim.*;

//___________________________________________________________________________________________________________________
//GLOBAL VARIABLES

  //sound (minim)
  Minim minim;
  AudioPlayer cue_hit, wall_hit, bobsaget, wtf, wtfloud, smd, ball_hit;
  
  //Defining the parent table
  Table table;

//___________________________________________________________________________________________________________________
//SETUP

void setup(){
  
  //create the table
  new_table();
  initialize_table();
  
  //Initialization:
  frameRate(60);
  size(1400, 800);
  background(0, 25, 60);

}

//___________________________________________________________________________________________________________________
//DRAW

void draw(){ //Organizational loop

  //if its in the regular game idle state
  if(game_state == 0){
    draw_idle(); //run the regular (idle) draw function
  }
  
  //scrub tester
  if(game_state == 1){
    gameOver(); //display the fail game
  }
  
  //if you have won
  if(game_state == 2){
    gameWin(); //display the win game
  }
}