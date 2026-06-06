void gameOver(){
  theme.pause();
  background (#f28482);
  textSize(70);
  text("GAMEOVER", 400, 400);
  gameover.play();
}

void gameoverClicks(){
  mode = INTRO;
}
