// import gif animation;
import gifAnimation.*;

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

// sound
Minim minim;
AudioPlayer introMusic;
AudioPlayer successSound;
AudioPlayer failureSound;

Gif introGif;

// ball
float ballX, ballY;
float ballVX, ballVY;
float ballD = 20;

// score and lives
int score;
int lives;
boolean won;

// paddle
float paddleX, paddleY;
float paddleW = 100;
float paddleH = 20;

// brick
int ROWS = 5;
int COLS = 8;
float brickD = 40;
float[] brickX = new float[ROWS * COLS];
float[] brickY = new float[ROWS * COLS];
boolean[] brickAlive = new boolean[ROWS * COLS];

color[] rowColors = {
  color(247, 37, 133),
  color(114, 9, 183),
  color(58, 12, 163),
  color(67, 97, 238),
  color(76, 201, 240)
};

void setup() {
  size(800, 600);
  textAlign(CENTER, CENTER);
  mode = INTRO;

  introGif = new Gif(this, "intro.gif");
  introGif.loop();
  
  // load sounds
  minim = new Minim(this);
  introMusic   = minim.loadFile("MUSIC.mp3");
  successSound = minim.loadFile("SUCCESS.mp3");
  failureSound = minim.loadFile("FAILURE.wav"); // don't have yet
  // find bounce paddle sound
  
  
  introMusic.loop();
  
  resetGame();
}

void resetGame() {
  ballX = width / 2;
  ballY = height / 2;
  ballVX = 2.5;
  ballVY = -2.5;

  paddleX = width / 2;
  paddleY = height - 40;

  score = 0;
  lives = 3;
  won = false;

  // set up the bricks using a loop
  for (int row = 0; row < ROWS; row++) {
    for (int col = 0; col < COLS; col++) {
      int i = row * COLS + col;
      brickX[i] = 50 + col * 80 + 40;
      brickY[i] = 50 + row * 50;
      brickAlive[i] = true;
    }
  }
}


void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }
}
