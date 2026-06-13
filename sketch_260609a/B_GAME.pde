void game() {
  background(15, 15, 30);

  // draw all the bricks
  for (int row = 0; row < ROWS; row++) {
    fill(rowColors[row]);
    for (int col = 0; col < COLS; col++) {
      int i = row * COLS + col;
      if (brickAlive[i]) {
        circle(brickX[i], brickY[i], brickD);
      }
    }
  }
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
    failureSound.rewind();
    failureSound.play();
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
  float dPaddle = dist(ballX, ballY, paddleX, paddleY);
  if (dPaddle < ballD/2 + paddleW/2 && ballVY > 0) {
    ballVY *= -1;
    // change angle based on where ball hits paddle
    ballVX = (ballX - paddleX) * 0.08;
  }

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
