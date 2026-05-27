void game(){
  background (#84a59d);
  
  text("Score: " + score, width/2, 50);
  text("Lives: " + lives, width/2, 100);
  
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
  if (dist(mouseX, mouseY, x, y) < 100){
    score = score +1;
  } else {
    lives = lives -1;
    if (lives == 0) mode = GAMEOVER;
  }
}
