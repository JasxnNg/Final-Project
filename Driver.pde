Kernel blur = new Kernel (new float[][] {
      {.08, .125, .08},
      {.125, .250, .125},
      {.08, .125, .08}
    }); 
int score; 
int size = 40; // size of each pixel 
int stage = 0; 
int highScore = 0; 

ArrayList<Enemy> enemies; 
ArrayList<Projectile> projectiles; 
Projectile bull; 
Player play; 
boolean change = true; 


void setup() {
  size (1920, 1280); 
  noStroke(); 
  enemies = new ArrayList<Enemy>(); 
  projectiles = new ArrayList<Projectile>(); 
  for (int x = 1; x < 12; x++) 
    for (int y = 1; y < 5; y++) 
      enemies.add (new Enemy (x * size + 100 * x, y * size + 40 * y)); 
  play = new Player(1000, 1000); 
  score = 0;  
}

void draw() { 
  if (stage == 0) 
    back(); 
  else if (stage == 1) {
    game(); }
  else if (stage == 2 ) 
    victory(); 
  else if (stage == 3) 
    gameOver();  
  keyPressed(); 
}

void back(){ 
  background(255); 
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
  PFont font = createFont("AFont.otf", 50);
  textFont(font); 
  fill(255); 
  text ("Score " + score, 300, 50); 
  text("Lives " + play.getLives(), 700, 50); 
  text ("High Score " + highScore, 1000, 50); 
  text("Press Space to shoot. Use arrow keys for movement", 300, 1200); 
  if (enemies.size() == 0)
    stage = 2; 
  for (int i = 0; i < enemies.size(); i++){  
      enemies.get(i).update();} //changes size of array so can't use enhanced for  
    for(Enemy i: enemies){  // bad fix for the problem where when I check things 
      if(i.getX() > width - 4 * size || i.getX() < 2 * size && change){
      for(Enemy j: enemies){
        j.velocity.x *= -1;
        j.updatePosY(size /3); // little scuffed, but it's all aligned now! 
       }
       break; 
    }
      } 
     change = true; 
      
  for (int i = 0; i < projectiles.size(); i++) { 
      projectiles.get(i).update(); 
      if (projectiles.get(i).getY() > height - 200) // garbage collection ? 
        projectiles.remove (i); 
  }
  play.update(); 
  if (bull != null) { 
    bull.update();}
  if (highScore < score) 
    highScore = score; 
  
  // setup the actual game 
}
void keyPressed(){
  if (key== 'x' || key == 'X') 
    stage = 1; 
  if (key == 'w' || key == 'W') {
    stage = 0;
    setup();
  }
  if (key == 'q' || key == 'Q') {
    stage = 2; 
  }
  
}
void victory () {
  PImage original = loadImage("zidane.png"); 
  PFont font;
  font = createFont("AFont.otf", 128);
  background(0); 
  textSize(100);
  fill(0, 255, 0); 
  text("Hooray! You defeated the code!", width/2 - 500, height/2); 
  textSize(50);
  text("Press W to start again", width/2 - 150, height/2 + 100); 
  
}

void gameOver() { 
  PFont font = createFont("AFont.otf", 128); 
  textFont(font); 
  background (0); 
  fill (0, 255, 0); 
  textSize(100); 
  text ("Game Over. The code took over.", width/2 - 500, height/2 - 150); 
  textSize ( 50); 
  text("Press W to start again", width/2 - 150, height/2); 
   text ("Score " + score, width/2 - 75, height / 2 + 100); 
  text ("High Score " + highScore, width/2 - 75, height / 2 + 150);
  
}
