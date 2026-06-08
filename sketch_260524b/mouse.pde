void mousePressed(){
  if (mode == OPTIONS){
    optionsClicks();
  }
}

void mouseDragged(){
  if (knobDragging){
    knobX = constrain(mouseX, sliderX, sliderX + sliderW);
    targetSize = map(knobX, sliderX, sliderX + sliderW, 50, 200);
  }
}

void mouseReleased(){
  knobDragging = false;

  if (mode == INTRO) introClicks();
  else if (mode == GAME) gameClicks();
  else if (mode == PAUSE) pauseClicks();
  else if (mode == GAMEOVER) gameoverClicks();
  else if (mode == OPTIONS) optionsClicks();
}
