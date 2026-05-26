void game(){
  background (#84a59d);
  
  //display target
  circle(x, y, d);
  
  //moving
  x = x + vx;
  y = y + vy;
  
  // bouncing
  if (x < 0 + d/2 || x > width - d/2) {
    vx = vx * -1;
  }
    if (y < 0 + d/2 || y > height - d/2) {
    vy = vy * -1;
  }
}

void gameClicks(){
  mode = GAMEOVER;
}
