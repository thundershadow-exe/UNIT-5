void pause(){
  theme.pause();
  fill (#264653);
  textSize(70);
  text("PAUSE ^", 400, 400);
  
  // pause button
  stroke (0);
  fill (#2a9d8f);
  circle (100, 100, 100);
  fill(0);
  textFont (brushFont);
  textSize(70);
  text(">", 100, 100);
  
}

void pauseClicks(){
  if (dist(mouseX, mouseY, 100, 100) < 50){
  mode = GAME;
  theme.play();
  }
}
