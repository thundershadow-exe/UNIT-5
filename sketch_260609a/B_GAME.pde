void game() {
  background(15, 15, 30);

 // move the ball
  ballX += ballVX;
  ballY += ballVY;

  // bounce off left and right walls
  if (ballX < ballD/2 || ballX > width - ballD/2) {
    ballVX *= -1;
  }

  // bounce off top wall
  if (ballY < ballD/2) {
    ballVY *= -1;
  }

  // ball falls off the bottom - lose a life
  if (ballY > height + ballD) {
    lives--;
    fill(255, 0, 0, 150);
    rect(0, 0, width, height);
    if (lives > 0) {
      missSound.rewind();
      missSound.play();
      }
    if (lives <= 0) {
      won = false;
      mode = GAMEOVER;
    } else {
      // reset ball position
      ballX  = width / 2;
      ballY  = height / 2;
      ballVX = 2.5;
      ballVY = -2.5;
    }
  }

  // paddle follows mouse, can't go off screen
  paddleX = mouseX;
  if (paddleX < paddleW/2) paddleX = paddleW/2;
  if (paddleX > width - paddleW/2) paddleX = width - paddleW/2;

 // ball hits paddle
if (ballY + ballD/2 >= paddleY - paddleH/2 &&     // ball bottom touches paddle top
    ballY - ballD/2 <= paddleY + paddleH/2 &&     // ball top touches paddle bottom
    ballX + ballD/2 >= paddleX - paddleW/2 &&     // ball right touches paddle left
    ballX - ballD/2 <= paddleX + paddleW/2 &&     // ball left touches paddle right
    ballVY > 0) {                                 // only bounce when moving downward

    ballVY *= -1;

    // angle control
    ballVX = (ballX - paddleX) * 0.08;

    bounceSound.rewind();
    bounceSound.play();

    // push ball out of paddle so it doesn't get stuck
    ballY = paddleY - paddleH/2 - ballD/2;
}

  // check if ball hits a brick
  for (int i = 0; i < ROWS * COLS; i++) {
    if (brickAlive[i]) {
      float d = dist(ballX, ballY, brickX[i], brickY[i]);
      if (d < ballD/2 + brickD/2) {
        brickAlive[i] = false;
        score = score + 1;
        ballVY = ballVY * -1;
        popSound.rewind();
        popSound.play();
      }
    }
  }

  // check if all bricks are gone
  int bricksLeft = 0;
  for (int i = 0; i < ROWS * COLS; i++) {
    if (brickAlive[i]) {
      bricksLeft = bricksLeft + 1;
    }
  }
  if (bricksLeft == 0) {
    won = true;
    mode = GAMEOVER;
  }

  // draw the bricks
  for (int row = 0; row < ROWS; row++) {
    fill(rowColors[row]);
    for (int col = 0; col < COLS; col++) {
      int i = row * COLS + col;
      if (brickAlive[i]) {
        circle(brickX[i], brickY[i], brickD);
      }
    }
  }

  // draw the paddle
  paddleX = mouseX;
  if (paddleX < paddleW / 2) {
    paddleX = paddleW / 2;
  }
  if (paddleX > width - paddleW / 2) {
    paddleX = width - paddleW / 2;
  }
  fill(200, 200, 255);
  ellipse(paddleX, paddleY, paddleW, paddleH);

  // draw the ball
  fill(255);
  circle(ballX, ballY, ballD);

  // show score and lives
  fill(255);
  textSize(20);
  textAlign(LEFT, TOP);
  text("Score: " + score, 10, 10);
  textAlign(RIGHT, TOP);
  text("Lives: " + lives, width - 10, 10);
  textAlign(CENTER, CENTER);
}
