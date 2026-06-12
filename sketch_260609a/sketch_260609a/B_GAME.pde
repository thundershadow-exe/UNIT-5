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
