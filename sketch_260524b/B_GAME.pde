void game(){
  background (#84a59d);
  textSize (40);
  text("Score: " + score, width/2, 50);
  text("Lives: " + lives, width/2, 100);
 
  // pause button
  stroke (0);
  fill (255);
  circle (100, 100, 100);
  
  //display target
  imageMode(CENTER);
  image(selectedTarget, x, y, targetSize, targetSize);
  imageMode(CORNER);

  
  //moving
  x = x + vx;
  y = y + vy;
  
  // bouncing
  if (x < 0 + targetSize/2 || x > width - targetSize/2) {
    vx = vx * -1;
  }
    if (y < 0 + targetSize/2 || y > height - targetSize/2) {
    vy = vy * -1;
  }
}

void gameClicks(){
  if (dist(mouseX, mouseY, x, y) < targetSize/2){
    score = score +1;
    click.rewind();
    click.play();
  } else if (dist(mouseX, mouseY, 100, 100) < 50){
    mode = PAUSE;
  } else {
    lives = lives -1;
    miss.rewind();
    miss.play();
    if (lives == 0) mode = GAMEOVER;
  }
}
