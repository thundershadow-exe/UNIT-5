// import minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;



// --- GLOBAL VARIABLES ---
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

// --- TARGET VARIABLES ---
float x, y, d;
float vx, vy;    // target velocity
int score, lives;

// --- SOUND VARIABLES ---
Minim minim;
AudioPlayer theme, click, miss, gameover;

void setup(){
  size(800,800);
  mode = INTRO;
  
    //target initialization
    x = width/2;
    y = height/2;
    d = 100;
    vx = random (-7, 7);
    vy = random (-7, 7);
    score = 0;
    lives = 3;
    
  textAlign(CENTER, CENTER);
  
  // minim (i'm so sorry to say this but the sound effect you gave us are erm... yeah. please don't deduct marks TwT)
  minim = new Minim(this);
  theme = minim.loadFile("theme.mp3"); // lol i apologise in advance for not having good music taste... XD judge me all you want but i do listen to funk all day
  click = minim.loadFile("click.mp3");
  miss = minim.loadFile("miss.mp3");
  gameover = minim.loadFile("gameover.mp3");
  
}


void draw(){
  if (mode == INTRO){
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER){
    gameOver();
  } else {
    println("Error: Mode = " + mode);
  }
  
}
