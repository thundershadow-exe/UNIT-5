void game() {
  background(#102b3f);

  // center line
  stroke(255);
  strokeWeight(2);
  line(width / 2, 0, width / 2, height);
  noStroke();

  // scoreboard
  textSize(50);
  fill(#efc3e6);
  text(leftscore, width / 4, 100);
  fill(#9ceaef);
  text(rightscore, 3 * width / 4, 100);

  // paddles
  fill(#892b64);
  circle(leftx, lefty, leftd);
  fill(#2e6f95);
  circle(rightx, righty, rightd);

  // balls
  fill(#c9b1ff);
  circle(ballx, bally, balld);

  // move the left paddle using S or W keys
  if (wkey) lefty = lefty - 5;
  if (skey) lefty = lefty + 5;

  // move the right paddle
  if (twoPlayer) {
    if (upkey) righty = righty - 5;
    if (downkey) righty = righty + 5;
  } else {
    if (righty < bally - 10) righty = righty + 4;
    if (righty > bally + 10) righty = righty - 4;
  }

  // keep paddles on screen
  if (lefty < leftd / 2) lefty = leftd / 2;
  if (lefty > height - leftd / 2) lefty = height - leftd / 2;
  if (righty < rightd / 2) righty = rightd / 2;
  if (righty > height - rightd / 2) righty = height - rightd / 2;

  // timer increment
  timer++;

  if (timer > 100) {
    ballx = ballx + vx;
    bally = bally + vy;
  }

  // compute radii
  float ballr = balld / 2;
  float leftr = leftd / 2;
  float rightr = rightd / 2;

  // bounce off top/bottom
  if (bally < ballr) {
    bally = ballr;
    vy = abs(vy);  
  }
  if (bally > height - ballr) {
    bally = height - ballr;
    vy = -abs(vy);
  }

 // LEFT paddle
if (dist(ballx, bally, leftx, lefty) <= ballr + leftr && vx < 0) {

  // bounce horizontally
  vx = abs(vx);

  // simple realistic angle: hit higher → go up, hit lower → go down
  vy = (bally - lefty) * 0.2;

  // push ball out
  float a = atan2(bally - lefty, ballx - leftx);
  ballx = leftx + cos(a) * (leftr + ballr);
  bally = lefty + sin(a) * (leftr + ballr);
}

// RIGHT paddle
if (dist(ballx, bally, rightx, righty) <= ballr + rightr && vx > 0) {

  vx = -abs(vx);
  vy = (bally - righty) * 0.2;

  float a = atan2(bally - righty, ballx - rightx);
  ballx = rightx + cos(a) * (rightr + ballr);
  bally = righty + sin(a) * (rightr + ballr);
}


  // scoring
  if (ballx < 0) {
    rightscore++;
    resetBall();
  }
  if (ballx > width) {
    leftscore++;
    resetBall();
  }

  // win conditions
  if (leftscore >= 3 || rightscore >= 3) {
    mode = GAMEOVER;
  }
}

void gameClicks() {
  // clicking the screen during game switches to pause
  mode = PAUSE;
}
