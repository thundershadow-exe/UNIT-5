// import minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// target option images
PImage selectedTarget;
PImage red, orange, yellow;

// fonts
PFont cattieFont;
PFont brushFont;

// slider variables
float targetSize = 100;
float sliderX = 200;
float sliderY = 650;
float sliderW = 400;
float sliderH = 10;
float knobX = sliderX + sliderW/2;
boolean knobDragging = false;

// --- GLOBAL VARIABLES ---
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int OPTIONS = 4;

// --- TARGET VARIABLES ---
float x, y;
float vx, vy;    // target velocity
int score, lives;

// --- SOUND VARIABLES ---
Minim minim;
AudioPlayer theme, click, miss, gameover;

// --- SETUP ---
void setup(){
  size(800,800);
  mode = INTRO;
  
   //target initialization
  selectedTarget = red;
  x = width/2;
  y = height/2;
  vx = random (-7, 7);
  vy = random (-7, 7);
    // target options
    red = loadImage("red.png");
    orange = loadImage("orange.png");
    yellow = loadImage("yellow.png");
    selectedTarget = red;   // default
    
  
    // fonts
    cattieFont = createFont("cattie.ttf", 70);
    brushFont = createFont ("brush.ttf", 30);
    textAlign(CENTER, CENTER);

  
    score = 0;
    lives = 3;
    
  
  // minim 
  minim = new Minim(this);
  theme = minim.loadFile("theme.mp3");
  click = minim.loadFile("click.mp3");
  miss = minim.loadFile("miss.mp3");
  gameover = minim.loadFile("gameover.mp3");
  
}


void draw(){
  if (mode == INTRO){
    intro();
  } else if (mode == OPTIONS){
    options(); 
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
