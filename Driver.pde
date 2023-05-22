Kernel blur = new Kernel (new float[][] {
      {.111, .111, .111},
      {.111, .111, .111},
      {.111, .111, .111}
    }); 
    
void setup() {
  size (1920, 1080); 
  PImage original = loadImage("Zidane.png"); 
  PImage processedbackground = original.copy();
  blur.apply(original,processedbackground); 
  image(processedbackground, 0, 0); 
}

void draw() { 
  
}

void gameOver() {
  setup(); 
}
