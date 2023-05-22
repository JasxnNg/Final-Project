Kernel blur = new Kernel (new float[][] {
      {.08, .125, .08},
      {.125, .250, .125},
      {.08, .125, .08}
    }); 
int speed = 1; //temp
void setup() {
  size (1920, 1280);
  background (255); 
  PImage original = loadImage("zidane.png"); 
  PImage processedbackground = original.copy();
  blur.apply(original,processedbackground); 
  image(processedbackground, 700, 0); 
  textSize(40); 
  fill(0); 
  text("Defeat the evil code snippets!", 100, 1000); 
  text("Press X to start....", 100, 1100); 
  
}

void draw() { 
  
}

void gameOver() {
  setup(); 
}
