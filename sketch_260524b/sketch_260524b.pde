// --- GLOBAL VARIABLES ---
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

// --- TARGET VARIABLES ---
float x, y, d;
float vx, vy;    // target velocity

void setup(){
  size(800,800);
  mode = INTRO;
    //target initialization
    x = width/2;
    y = height/2;
    d = 100;
    vx = random (-5, 5);
    vy = random (-5, 5);
    
  textAlign(CENTER, CENTER);
  
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
