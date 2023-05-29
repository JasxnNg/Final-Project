Kernel blur = new Kernel (new float[][] {
      {.08, .125, .08},
      {.125, .250, .125},
      {.08, .125, .08}
    }); 
int speed = 1; //temp
int score = 0; 
int size = 40; 
int w, h; 
int border = h/2; 
boolean freeMove = false; 
int stage = 0; 

void setup() {
  size (1920, 1280);
  background (255); 
}

void draw() { 
  if (stage == 0) 
    back(); 
  else if (stage == 1) {
    game(); }
  else if (stage == 2 ) 
    victory(); 
  else if (stage == 3) 
    lose(); 
  keyPressed(); 
}

void back(){ 
  PImage original = loadImage("zidane.png"); 
  PImage processedbackground = original.copy();
  blur.apply(original,processedbackground); 
  image(processedbackground, 700, 0); 
  textSize(40); 
  PFont font;
  font = createFont("AFont.otf", 128); 
  textFont(font); 
  fill(0); 
  text("Press X", 75, 100); 
  text("to Start", 75, 200);
  text("Four score and seven years ago,", 75, 1000); 
  text("the Codebenders attacked...", 75, 1100); 
  text("Defeat the busted code!", 75, 1200);  
}
void game (){
  background(0); 
  // setup the actual game 
}
void keyPressed(){
  if (key== 'x' || key == 'X') 
    stage = 1; 
  
}
void victory () {
  PImage original = loadImage("zidane.png"); 
  PFont font;
  font = createFont("AFont.otf", 128);
  
}
void lose() {} 
void gameOver() {
  setup(); 
}
