void game(){
   background (#84a59d);
  
  //paddles
  circle (leftx, lefty, leftd);
  circle (rightx, righty, rightd);
  
  // move paddles
  if (wkey == true) lefty = lefty - 5;
  if (skey == true) lefty = lefty + 5;
  if (upkey == true) righty = righty - 5;
  if (downkey == true) righty = righty + 5;
  
  //ball
  circle(ballx, bally, balld);
}

void gameClicks(){
}
