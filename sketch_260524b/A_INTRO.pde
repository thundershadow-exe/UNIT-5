void intro(){
 theme.play();
 
  background(#f4a261);
  
    // title
  fill(255);
  textSize(70);
  text("PEPPER CLICKER", width/2, 175);
  textSize(30);
  text ("ft. an AI version of my cat Dr. Pepper, M.D.", width/2, 225);

  // START button
  fill(255);
  rect(175, 600, 200, 100, 30);
  fill(0);
  textSize(40);
  text("START", 275, 650);

  // OPTIONS button
  fill (255);
  rect(425, 600, 200, 100, 30);
  fill(0);
  text("OPTIONS", 525, 650);
  
    //display target
  imageMode(CENTER);
  image(selectedTarget, x, y, 300, 300);
  imageMode(CORNER);
  
}

void introClicks(){

  // START button
  if (mouseX > 175 && mouseX < 375 &&
      mouseY > 600 && mouseY < 700) {
    mode = GAME;
  }

  // OPTIONS button
  if (mouseX > 425 && mouseX < 625 &&
      mouseY > 600 && mouseY < 700) {
    mode = OPTIONS;
  }
}
