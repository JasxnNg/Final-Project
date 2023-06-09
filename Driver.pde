import processing.sound.*; 

//sound files 
SoundFile projectileLaunch; 
SoundFile playerCollision;
SoundFile enemyCollision;

Kernel blur = new Kernel (new float[][] {
      {.08, .125, .08},
      {.125, .250, .125},
      {.08, .125, .08}
    }); 
int score; 
int size = 40; // size of each pixel 
int stage = 0; //background 
int highScore = 0; 
int currentDiff; //current Difficulty 

ArrayList<Enemy> enemies; 
ArrayList<Projectile> projectiles; 
Projectile bull; 
Player play; 
String[] difficulty; // like the car thing 
PFont font;



void setup() {
  size (1920, 1280); 
  noStroke(); 
  font = createFont("AFont.otf", 128); 
  projectileLaunch = new SoundFile(this, "projectileLaunch.wav");
  playerCollision = new SoundFile(this,   "playerCollision.wav");
  enemyCollision = new SoundFile(this, "enemyCollision.wav");
  enemies = new ArrayList<Enemy>(); //intialize enemies arraylist 
  projectiles = new ArrayList<Projectile>(); //projectiles (enemies') arraylist 
  for (int x = 1; x < 12; x++) 
    for (int y = 1; y < 5; y++) 
      enemies.add (new Enemy (x * size + 100 * x, y * size + 40 * y)); //fill up the array
  play = new Player(1000, 1000); //coords of start 
  score = 0;  
  difficulty = new String[] {"Easy", "Medium", "Hard"}; 
 
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

//create the background and display everything 
void back(){ 
  background(255); 
  PImage original = loadImage("zidane.png"); 
  PImage processedbackground = original.copy();
  blur.apply(original,processedbackground); 
  image(processedbackground, 700, 0); 
  textSize(40); 
  textFont(font); 
  fill(0); 
  text("Press E", 75, 100); 
  text("to Start", 75, 200);
  text("Four score and seven years ago,", 75, 1000); 
  text("the Codebenders attacked...", 75, 1100); 
  text("Defeat the busted code!", 75, 1200); 
  textSize(50); 
  text ("Press Up or Down to ",  75, 300); 
  text ("switch through difficulty", 75, 400); 
  text("Current Difficulty " + difficulty[currentDiff], 75, 500);
}

//playing the actual game 
void game (){
  
  background(0); 
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
      if(i.getX() > width - 4 * size || i.getX() < 2 * size){
      for(Enemy j: enemies){
        j.updateVelocityX(-1);
        j.updatePosY(size /3); // little scuffed, but it's all aligned now! 
       }
       break; 
    }
      } 
      
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
  if (key== 'e' || key == 'E') 
    stage = 1; 
  if (key == 'w' || key == 'W') {
    stage = 0;
    setup();
  }
  if (key == 'q' || key == 'Q') {
    stage = 2; 
  
}
}
void keyReleased (){
  if (stage == 0) { //it has to be the background stage in order to change difficulty 
    if (keyCode == UP) 
    currentDiff = (currentDiff + 1) % 3;  
  if (keyCode == DOWN) 
    currentDiff = (currentDiff + 2) % 3;
}
// this is to demonstrate the loss 
 if (key == 'p' || key == 'P') {
    size = 100; 
  }
  
  if (key == 'o' || key == 'O') 
    size = 40; 
}

//victory screen 
void victory () {
  background(0); 
  textSize(100);
  fill(0, 255, 0); 
  text("Hooray! You defeated the code!", width/2 - 500, height/2); 
  textSize(50);
  text("Press W to start again", width/2 - 150, height/2 + 100); 

  
}
// losing screen...
void gameOver() { 
  background (0); 
  fill (0, 255, 0); 
  textSize(100); 
  text ("Game Over. The code took over.", width/2 - 500, height/2 - 150); 
  textSize ( 50); 
  text("Press W to start again", width/2 - 150, height/2); 
  text ("Score " + score, width/2 - 75, height / 2 + 100); 
  text ("High Score " + highScore, width/2 - 75, height / 2 + 150);
  
}
