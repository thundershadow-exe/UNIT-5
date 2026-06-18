void gameOver(){
  background (#f28482);
  fill (#941c2f);
  textSize(70);
  text("GAMEOVER", 400, 250);
  fill (#264653);
  textSize (50);
  text("Score: " + score, width/2, 380);
  fill (#734f5a);
  textSize (30);
  text("High Score: " + highScore + " ^", width/2, 450);
}


void gameoverClicks() {
  resetGame();
  mode = INTRO;
  theme.rewind();
  theme.play();
}
