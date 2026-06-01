void game(){
   background (#102b3f);
  
  //paddles
  fill (#892b64);
  circle (leftx, lefty, leftd);
  fill (#2e6f95);
  circle (rightx, righty, rightd);
  

  // move paddles
  if (wkey == true) lefty = lefty - 5;
  if (skey == true) lefty = lefty + 5;
  
  if (upkey == true) righty = righty - 5;
  if (downkey == true) righty = righty + 5;

  // keep paddles inside screen
  if (lefty < leftd/2) lefty = leftd/2;
  if (lefty > height - leftd/2) lefty = height - leftd/2;

  if (righty < rightd/2) righty = rightd/2;
  if (righty > height - rightd/2) righty = height - rightd/2;
  
  //ball
  fill (#5c4d7d);
  circle(ballx, bally, balld);
  
  // move ball
  ballx = ballx + vx;
  bally = bally + vy;

  // bounce off top/bottom
  if (bally < 0 || bally > height) {
  vy = vy * -1;
}
  
// compute radii
float ballr = balld/2;
float leftr = leftd/2;
float rightr = rightd/2;

// check collision
if (dist(ballx, bally, leftx, lefty) <= ballr + leftr) {
  vx = abs(vx);
}
if (dist(ballx, bally, rightx, righty) <= ballr + rightr) {
  vx = -abs(vx);
}



}

void gameClicks(){
}
