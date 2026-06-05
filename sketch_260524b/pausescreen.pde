void pausescreen(){
  theme.pause();
}

void pauseClicks(){
  if (dist(mouseX, mouseY, 100, 100) < 50){
  mode = GAME;
  theme.play();
  }
}
