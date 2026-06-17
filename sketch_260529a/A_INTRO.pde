void intro() {
  background(#30343f);

  // title
  fill(255);
  textFont (glitchFont);
  textSize(170);
  text("PONG", width / 1.97, 205);
  fill(#f72585);
  text("PONG", width / 2, 200);
  fill(255);
  textSize(24);
  text("Choose a game mode", width / 2, 310);

  // 1 player button
  // button box: x 90 to 310, y 460 to 540
  if (mouseX > 90 && mouseX < 310 && mouseY > 460 && mouseY < 540) {
    strokeWeight (3);
    stroke (#4cc9f0);
    fill(#f72585);
  } else {
    fill(255);
  }
  rect(90, 460, 220, 80, 15);

  if (mouseX > 90 && mouseX < 310 && mouseY > 460 && mouseY < 540) {
    fill(255);
  } else {
    fill(0);
  }
  textSize(34);
  text("1 Player", 200, 500);

  // 2 player button
  // button box: x 490 to 710, y 460 to 540
  if (mouseX > 490 && mouseX < 710 && mouseY > 460 && mouseY < 540) {
    strokeWeight (3);
    stroke (#ffd500);
    fill(#f72585);
    fill(#f72585);
  } else {
    fill(255);
  }
  rect(490, 460, 220, 80, 15);

  if (mouseX > 490 && mouseX < 710 && mouseY > 460 && mouseY < 540) {
    fill(255);
  } else {
    fill(0);
  }
  textSize(34);
  text("2 Player", 600, 500);
}

void introClicks() {
  // 1 Player button
  if (mouseX > 90 && mouseX < 310 && mouseY > 460 && mouseY < 540) {
    twoPlayer = false;
    resetGame();
    mode = GAME;
  }
  // 2 Player button
  if (mouseX > 490 && mouseX < 710 && mouseY > 460 && mouseY < 540) {
    twoPlayer = true;
    resetGame();
    mode = GAME;
  }
}
