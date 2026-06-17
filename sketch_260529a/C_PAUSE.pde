void pause() {
  background(#102b3f);

  stroke(255);
  strokeWeight(2);
  line(width / 2, 0, width / 2, height);
  noStroke();

  textSize(60);
  fill(#efc3e6);
  text(leftscore, width / 4, 100);
  fill(#9ceaef);
  text(rightscore, 3 * width / 4, 100);

  fill(#892b64);
  circle(leftx, lefty, leftd);
  fill(#2e6f95);
  circle(rightx, righty, rightd);
  fill(#c9b1ff);
  circle(ballx, bally, balld);

  // paused overlay
  fill(0, 0, 0, 160);
  rect(0, 0, width, height);

  // PAUSED text
  fill(#f72585);
  textSize(90);
  text("PAUSED", width / 2, height / 2 - 50);

  fill(255);
  textSize(26);
  text("Click anywhere to resume", width / 2, height / 2 + 60);
}

void pauseClicks() {
  // click anywhere to go back to the game
  mode = GAME;
}
