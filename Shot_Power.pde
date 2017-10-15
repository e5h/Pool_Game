//Storing the power of the shot
  Float shot_power = 0.0;

//change the shot power with mousewheel
void mouseWheel(MouseEvent event) {
  
  //makes sure it is in bounds (cant go below 0, above 10)
  if((event.getCount() > 0 && shot_power < 10) || (event.getCount() < 0 && shot_power > 0)){
    shot_power += event.getCount();
  }
}

//change shot power with up and down arrows keys
void keyPressed() {
  
  //makes sure it is in bounds (cant go below 0, above 10)
  if((keyCode == 38 && shot_power < 10) || (keyCode == 40 && shot_power > 0)){
    if(keyCode == 38){
      shot_power += 1;
    }
    if(keyCode == 40){
      shot_power -= 1;
    }
  }
}

//draw the shot power

void draw_shot_power(int x, int y){
  
    stroke(0); //Black outline
    strokeWeight(2); //Heavier outline
    fill(255); //White inside
    
    rect(x, y + 20, 100, 20); //100 wide, 10 high at mouse pos

    //color between green (low power) and red (high power)
    fill(shot_power * 25, 255 - (shot_power * 25), 0);
    rect(x, y + 20, (shot_power * 10), 20); //size scaled on shot power
    
    fill(0); //Black color
    textSize(11); //Text size of 11
    text("Shot power: " + shot_power, x + 5, y + 35); //say what shot power is
      
}