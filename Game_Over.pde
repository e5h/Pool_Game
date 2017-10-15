//game fail state
int game_state = 0;
//0 = idle (play game in this state)
//1 = lose
//2 = win

//MAIN FUNCTION:
//IF YOU SUCK

void gameOver(){
  
  //draw a big red game over
  background(255, 0, 0);
  fill(0);
  textSize(150);
  text("GAME OVER", 230, 400);
  
  //display the left click message
  fill(0);
  textSize(40);
  text("Left click to restart the game.", 380, 480);
  
}

void gameWin(){
  
  //draw a big green game win
  background(0, 255, 0);
  fill(0);
  textSize(150);
  text("YOU WIN", 340, 400);
  
  //display the left click image
  fill(0);
  textSize(40);
  text("Left click to restart the game.", 380, 480);
  
}