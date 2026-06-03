// --- GLOBAL VARIABLES ---
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

// --- ENTITY VARIABLES ---
float leftx, lefty, leftd, rightx, righty, rightd; // paddles
float ballx, bally, balld; // ball
float vx, vy;

// keyboard variables
boolean wkey, skey, upkey, downkey;

// radii variables
 float leftr, rightr, ballr;
 
// scoring
int leftscore, rightscore, timer;

void setup(){
  size(800,800);
  mode = INTRO;
  textAlign(CENTER, CENTER);
  
    //paddle initialization
    leftx = 0;
    lefty = height/2;
    leftd = 200;
    rightx = width;
    righty = height/2;
    rightd = 200;
    
    // ball initialization
    ballx = width/2;
    bally = height/2;
    balld = 100;
    vx = 5;
    vy = 3;
    
    // keyboard variable initialization
    wkey = skey = upkey = downkey = false;
}

void draw(){
  if (mode == INTRO){
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER){
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }
  
}
