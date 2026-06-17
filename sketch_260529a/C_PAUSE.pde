void pause() {
  background(#102b3f);

  stroke(255);
  strokeWeight(2);
  line(width / 2, 0, width / 2, height);
  noStroke();

  textSize(60);
  fill(#2a6a8a);
  text(leftscore, width / 4, 100);
  fill(#7a6a00);
  text(rightscore, 3 * width / 4, 100);

  fill(#155a78);
  circle(leftx, lefty, leftd);
  fill(#7a5f00);
  circle(rightx, righty, rightd);
  fill(#6a1a47);
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
