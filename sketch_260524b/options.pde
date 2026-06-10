void options(){
  background(#264653);

  fill(255);
  textSize(70);
  text("^ OPTIONS   ", width/2, 100);
  textSize(40);
  text("Target Color", width/2, 180);

  // target choice buttons
  image(red,    200, 230, 120, 120);
  image(orange, 340, 230, 120, 120);
  image(yellow, 480, 230, 120, 120);

  // slider
  fill(255);
  text("Target Size", width/2, 420);
  fill(200);
  rect(sliderX, sliderY, sliderW, sliderH, 5);
  fill(255);
  ellipse(knobX, sliderY + sliderH/2, 30, 30);


  // preview
  imageMode(CENTER);
  image(selectedTarget, width/2, 540, targetSize, targetSize);
  imageMode(CORNER);

  // back button
  fill(255);
  rect(width/2 - 100, 700, 200, 80, 20);
  fill(0);
  textSize(35);
  text("BACK ^", width/2, 740);
}

void optionsClicks(){
  //button math
  if (mouseY > 230 && mouseY < 350){

    if (mouseX > 200 && mouseX < 320){
      selectedTarget = red;
    }
    if (mouseX > 340 && mouseX < 460){
      selectedTarget = orange;
    }
    if (mouseX > 480 && mouseX < 600){
      selectedTarget = yellow;
    }
  }

  //slider drag math
  if (dist(mouseX, mouseY, knobX, sliderY + sliderH/2) < 20){
    knobDragging = true;
  }

  //back button math
  if (mouseX > width/2 - 100 && mouseX < width/2 + 100 &&
      mouseY > 700 && mouseY < 780){
    mode = INTRO;
  }
}
