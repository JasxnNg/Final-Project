Kernel blur = new Kernel (new float[][] {
      {.08, .125, .08},
      {.125, .250, .125},
      {.08, .125, .08}
    }); 
int score; 
int size = 40; // size of each pixel 
int w, h; 
int stage = 0; 
int highScore = 0; 

ArrayList<Enemy> enemies; 
ArrayList<Projectile> projectiles; 
Projectile bull; 
Player play; 


void setup() {
  size (1920, 1280);
  w = width/size; 
  h = height/size; 
  noStroke(); 
  enemies = new ArrayList<Enemy>(); 
  projectiles = new ArrayList<Projectile>(); 
  for (int x = 1; x < 12; x++) 
    for (int y = 1; y < 5; y++) 
      enemies.add (new Enemy (x * size + 80 * x, y * size + 40 * y)); 
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
  
  for (int i = 0; i < enemies.size(); i++){ 
      enemies.get(i).show(); 
      
      enemies.get(i).update();} 
      
  for (int i = 0; i < projectiles.size(); i++) {
      projectiles.get(i).show(); 
      projectiles.get(i).update(); 
      if (projectiles.get(i).getY() > height - 200) 
        projectiles.remove (i); 
  }
  play.show(); 
  play.update(); 
  if (bull != null) {
    bull.show(); 
    bull.update(); }
  
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

void gameOver() {
  setup(); 
  stage = 0; 
}
