void gameover() {
  background(#30343f);

  // show final scores at the top
  textSize(60);
  fill(#a1e3f7);
  text(leftscore, width / 4, 100);
  fill(#ffff00);
  text(rightscore, 3 * width / 4, 100);

  // winner message
  fill(#f72585);
  textSize(90);

  if (leftscore >= 3) {
    fill(#a1e3f7);
    text("LEFT", width / 2, height / 2 - 80);
    text("WINS!", width / 2, height / 2 + 20);
  } else {
    fill(#ffff00);
    text("RIGHT", width / 2, height / 2 - 80);
    text("WINS!", width / 2, height / 2 + 20);
  }

  // click to play again prompt
  fill(#f72585);
  textSize(26);
  text("Click anywhere to play again", width / 2, height / 2 + 140);
}

void gameoverClicks() {
  playedEndSound = false;
  resetGame();
  introMusic.rewind();
  introMusic.loop();
  mode = INTRO;
}
