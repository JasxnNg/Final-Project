Kernel blur = new Kernel (new float[][] {
      {.08, .125, .08},
      {.125, .250, .125},
      {.08, .125, .08}
    }); 
int speed = 1; //temp

<<<<<<< Updated upstream
=======
int size = 40; 
int w, h; 
int border = h/2; 
boolean freeMove = false; 

>>>>>>> Stashed changes
void setup() {
  size (1440, 960);
  background (255); 
  PImage original = loadImage("zidane.png"); 
  PImage processedbackground = original.copy();
  blur.apply(original,processedbackground); 
  image(processedbackground, 700, 0); 
  textSize(40); 
  PFont font;
  font = createFont("AFont.otf", 128); 
  textFont(font); 
  fill(0); 
  text("Defeat the evil code snippets!", 100, 1000); 
  text("Press X to start....", 100, 1100); 
  
}

void draw() { 
  
}

void keyPressed(){
  
}

void gameOver() {
  setup(); 
}
