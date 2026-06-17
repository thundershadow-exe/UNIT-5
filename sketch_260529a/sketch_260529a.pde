// import minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// fonts
PFont glitchFont;

// --- GLOBAL VARIABLES ---
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

// sound
Minim minim;
AudioPlayer introMusic;
AudioPlayer endSound;
AudioPlayer missSound;
AudioPlayer bounceSound;

boolean playedEndSound = false;


// true = 2 human players, false = 1 player vs AI
boolean twoPlayer;

// entity variables
float leftx, lefty, leftd;
float rightx, righty, rightd;
float ballx, bally, balld;
float vx, vy;

// keyboard variables
boolean wkey, skey, upkey, downkey;

// scoring
int leftscore, rightscore, timer; 

void setup() {
  size(800, 800);
  textAlign(CENTER, CENTER);
  resetGame();
  mode = INTRO;
  
  // load sounds
  minim = new Minim(this);
  introMusic   = minim.loadFile("MUSIC.mp3");
  endSound = minim.loadFile("END.mp3");
  missSound = minim.loadFile("MISS.mp3");
  bounceSound = minim.loadFile("BOUNCE.mp3");
  
  // load fonts
  glitchFont = createFont ("glitch.ttf", 70);
  
    introMusic.loop();
}

// called at the very start and when returning to intro from gameover
void resetGame() {
  //paddle initialization
  leftx = 0;
  lefty = height / 2;
  leftd = 200;
  rightx = width;
  righty = height / 2;
  rightd = 200;

  // ball initialization
  ballx = width / 2;
  bally = height / 2;
  balld = 80;
  vx = 5;
  vy = 3;

  // reset scores
  leftscore = 0;
  rightscore = 0;
  timer = 0;

  // keyboard variable initialization
  wkey = skey = upkey = downkey = false;
}

// puts ball back in middle and waits
void resetBall() {
  ballx = width / 2;
  bally = height / 2;
  // alternate ball direction using frame count (even = right, odd = left)
  if (frameCount % 2 == 0) {
    vx = 5;
  } else {
    vx = -5;
  }
  vy = 3;
  timer = 0;
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    introMusic.pause();
    if (!playedEndSound) {
      endSound.rewind();
      endSound.play();
      playedEndSound = true;
    }
    gameover();
  }
}
