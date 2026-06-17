void gameover() {
  background(#102b3f);

  // show final scores at the top
  textSize(60);
  fill(#efc3e6);
  text(leftscore, width / 4, 100);
  fill(#9ceaef);
  text(rightscore, 3 * width / 4, 100);

  // winner message
  fill(#f72585);
  textSize(90);

  if (leftscore >= 3) {
    text("LEFT", width / 2, height / 2 - 80);
    text("WINS!", width / 2, height / 2 + 20);
  } else {
    text("RIGHT", width / 2, height / 2 - 80);
    text("WINS!", width / 2, height / 2 + 20);
  }

  // click to play again prompt
  fill(200);
  textSize(26);
  text("Click anywhere to play again", width / 2, height / 2 + 140);
}

void gameoverClicks() {
  // reset everything and go back to intro screen
  resetGame();
  mode = INTRO;
}
