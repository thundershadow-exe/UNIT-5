void gameOver(){
  theme.pause();
  background (#f28482);
  textSize(70);
  text("GAMEOVER", 400, 400);
  gameover.play();
}


void gameoverClicks() {
  resetGame();
  mode = INTRO;
  theme.rewind();
  theme.play();
}
