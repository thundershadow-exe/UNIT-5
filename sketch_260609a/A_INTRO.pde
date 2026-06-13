void intro() {

image(introGif,
      -width * 0.25,
      -height * 0.25,
      width * 1.50,
      height * 1.50);


  fill(0, 0, 0, 10);
  rect(0, 0, width, height);

  // Title
  fill(255, 230, 50);
  textSize(70);
  text("BREAKOUT", width/2, height/2 - 60);

  // Subtitle
  fill(255, 255, 255);
  textSize(25);
  text("Click anywhere to start", width/2, height/2 + 10);

  // Small hint
  fill(180, 180, 255);
  textSize(20);
  text("Use mouse to control the paddle", width/2, height/2 + 60);
}

void introMousePressed() {
  mode = GAME;
}
