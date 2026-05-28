void intro(){
 theme.play();
 
  background(#f4a261);
  
    // Title
  fill(255);
  textSize(70);
  text("PEPPER CLICKER", width/2, 200);

  // Big Start Button
  fill(255);
  rect(300, 500, 200, 100, 20);

  // Button Text
  fill(0);
  textSize(40);
  text("START", 400, 550);
  
}

void introClicks(){
  if (mouseX > 300 && mouseX <500 && 
      mouseY > 500 && mouseY < 600) {
  mode = GAME;
  }
}
