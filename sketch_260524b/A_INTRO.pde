void intro(){
 theme.play();
 
  background(#f4a261);
  
    // title
  fill(255);
  textFont (cattieFont);
  textSize(95);
  text("PEPPER CLICKER", width/2, 155);
  textFont (brushFont);
  textSize(30);
  text ("ft. an AI version of my cat Dr. Pepper, M.D.", width/2, 225);

  // START button
  if (mouseX > 175 && mouseX < 375 &&
      mouseY > 600 && mouseY < 700) {
    strokeWeight(3);
    stroke(#264653);
    fill(#2a9d8f);
  } else {
    noStroke();
    fill(255);
  }
  rect(175, 600, 200, 100, 30);

  if (mouseX > 175 && mouseX < 375 &&
      mouseY > 600 && mouseY < 700) {
    fill(255);
  } else {
    fill(0);
  }
  textSize(30);
  text("START ^", 275, 650);

  // OPTIONS button
  if (mouseX > 425 && mouseX < 625 &&
      mouseY > 600 && mouseY < 700) {
    strokeWeight(3);
    stroke(#264653);
    fill(#367092);
  } else {
    noStroke();
    fill(255);
  }
  rect(425, 600, 200, 100, 30);
  
  if (mouseX > 425 && mouseX < 625 &&
      mouseY > 600 && mouseY < 700) {
    fill(255);
  } else {
    fill(0);
  }
  text("OPTIONS ^", 525, 650);
  
    //display target
  imageMode(CENTER);
  image(selectedTarget, x, y, 300, 300);
  imageMode(CORNER);
  
}

void introClicks(){

  // START button
  if (mouseX > 175 && mouseX < 375 &&
      mouseY > 600 && mouseY < 700) {
      fill(0);
      rect(175, 600, 200, 100, 30);
    mode = GAME;
  }

  // OPTIONS button
  if (mouseX > 425 && mouseX < 625 &&
      mouseY > 600 && mouseY < 700) {
    mode = OPTIONS;
  }
}
