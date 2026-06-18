void game(){
  background (#84a59d);
  textSize (40);
  text("Score: " + score, width/2, 50);
  text("Lives: " + lives, width/2, 100);
 
  // pause button
  stroke (0);
  fill (#e9c46a);
  circle (100, 100, 100);
  fill(0);
  textFont (brushFont);
  textSize(70);
  text("| |", 100, 100);
  
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

void resetGame() {
  gameover.rewind();
  gameover.pause();
  
  score = 0;
  lives = 3;

  x = width/2;
  y = height/2;
  vx = random(-7, 7);
  vy = random(-7, 7);
}


void gameClicks(){
  if (dist(mouseX, mouseY, x, y) < targetSize/2){
    vx = vx * 1.1;
    vy = vy * 1.1;
    score = score +1;
    click.rewind();
    click.play();
  } else if (dist(mouseX, mouseY, 100, 100) < 50){
    mode = PAUSE;
  } else {
    lives = lives -1;
    fill(255, 0, 0, 150); // flash when lose a life
    rect(0, 0, width, height);
    miss.rewind();
    miss.play();
    if (lives == 0) {
  if (score > highScore) {
    highScore = score;
  }
  mode = GAMEOVER;
}

  }
}
