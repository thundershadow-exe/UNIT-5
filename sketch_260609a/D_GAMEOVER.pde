void gameover() {
  background(20, 5, 5);
  introMusic.pause();

  if (!playedEndSound) {
    if (won) {
      successSound.rewind();
      successSound.play();
    } else {
      failureSound.rewind();
      failureSound.play();
    }
    playedEndSound = true;
  }

  if (won) {
    fill(80, 255, 120);
    textSize(64);
    text("You Won!", width/2, height/2 - 60);
  } else {
    fill(255, 80, 80);
    textSize(64);
    text("You Lost!", width/2, height/2 - 60);
  }

  fill(255);
  textSize(22);
  text("Score: " + score, width/2, height/2 + 10);

  fill(frameCount, 200, 255);
  textSize(20);
  text("Click to restart", width/2, height/2 + 60);
}

void gameoverClicks() {
  playedEndSound = false;
  resetGame();
  introMusic.rewind();
  introMusic.loop();
  mode = INTRO;
}
