//Function called during setup and when the game is reset.
//Essentially 'restarts' the table and all of it's parameters, and resets the timer.
void new_table(){
  
  //defining the initial table parameters
  table = new Table(
  new Ball [ball_count],
  new Ball (400, 400, 12, 255, 255, 255),
  new Stick(400, 400, mouseX, mouseY, 255, 200, 150, 380)
  );
  
  //table timer
  table.start_time = millis();
  table.current_time = 0;
  table.timer_len = 600000;
  
  //declaring each pool ball
  table.b_arr[0] = new Ball(700, 400, 12, 255, 0, 0);
  table.b_arr[1] = new Ball(725, 385, 12, 0, 255, 0);
  table.b_arr[2] = new Ball(725, 415, 12, 0, 0, 255);
  table.b_arr[3] = new Ball(750, 370, 12, 125, 0, 255);
  table.b_arr[4] = new Ball(750, 400, 12, 255, 255, 0);
  table.b_arr[5] = new Ball(750, 430, 12, 255, 0, 255);
  table.b_arr[6] = new Ball(775, 355, 12, 0, 255, 255);
  table.b_arr[7] = new Ball(775, 385, 12, 255, 125, 0);
  table.b_arr[8] = new Ball(775, 415, 12, 255, 125, 125);
  table.b_arr[9] = new Ball(775, 445, 12, 125, 255, 0);
  
  //reset the shit
  game_state = 0;
  shot_power = 0.0;
  table.score = 0;
  
}

//one time variable setup for library objects and pockets
//this is not repeated, only used to make the setup function shorter.
void initialize_table(){

  //pepe
  pepe = loadImage("pepe.png");
  
  //table timing
  table.start_time = millis();
  table.current_time = 0;
  
  //sound files
  minim = new Minim(this);
  cue_hit = minim.loadFile("cue_hit.wav");
  wall_hit = minim.loadFile("wall_hit.wav");
  bobsaget = minim.loadFile("bobsaget.wav");
  wtf = minim.loadFile("wtf.wav");
  wtfloud = minim.loadFile("wtfloud.wav");
  smd = minim.loadFile("smd.wav");
  ball_hit = minim.loadFile("ball_hit.wav");
  
  //setting up all the pockets
  table_pockets[0] = new Pocket (100.0, 100.0, pocket_r, 0.0, 90.0); //Top left
  table_pockets[1] = new Pocket (700.0, 100.0, pocket_r, 0.0, 180.0); //Top middle
  table_pockets[2] = new Pocket (1300.0, 100.0, pocket_r, 90.0, 180.0); //Top right
  table_pockets[3] = new Pocket (100.0, 700.0, pocket_r, 270.0, 360.0); //Bottom left
  table_pockets[4] = new Pocket (700.0, 700.0, pocket_r, 180.0, 360.0); //Bottom middle
  table_pockets[5] = new Pocket (1300.0, 700.0, pocket_r, 180.0, 270.0); //Bottom right
  
}