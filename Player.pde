

public class Player extends Spaceship{
  private int lives = 3;
  //this sprite is unique to the Spaceship class
    int[][][] model = new int[][][] {{
       {0,0,0,0,1,0,0,0,0},
       {0,0,0,0,1,0,0,0,0},
       {0,1,0,1,1,1,0,1,0},
       {1,1,1,1,1,1,1,1,1},
       {0,1,1,1,1,1,1,1,0},
       {0,0,1,1,1,1,1,0,0},
       {1,0,0,0,1,0,0,0,1}
  },
  {
       {0,0,0,0,1,0,0,0,0},
       {0,0,0,0,1,0,0,0,0},
       {0,1,0,1,0,1,0,1,0},
       {1,0,1,1,1,1,0,1,1},
       {0,0,1,1,1,1,1,1,0},
       {0,0,1,1,1,1,1,0,0},
       {1,0,0,0,1,0,0,0,1}
  }, 
  {
       {0,0,0,0,1,0,0,0,0},
       {0,0,0,0,1,0,0,0,0},
       {0,1,0,0,0,1,0,1,0},
       {1,0,1,0,1,1,0,1,1},
       {0,0,0,1,1,1,0,1,0},
       {0,0,1,1,1,1,1,0,0},
       {1,0,0,0,1,0,0,0,1}
  }
  }; 
  
  public Player (float posx, float posy) {
      super( posx, posy, 0, 0); }


void update(){
  // make the size 
  keyPressed(); 
 // if(playerHit(bullets)){ failed code... this was the thing I had a problem with 
//      lives--;
//      if(lives == 0){
//        stage = 3;
//      }
//  }  //reset the PVector

//can only shoot once it passes through 
  if (bull != null && bull.getY() < 0 ) 
    bull = null; 
    
  //collision mechanics for player 
   for (int i = 0; i < projectiles.size(); i++) { 
     if (projectiles.get(i) != null && // just in case! 
         Math.abs(projectiles.get(i).getX() - play.getX()) < size - 3 // makes it easier for us
         && Math.abs(projectiles.get(i).getY() - play.getY())< size - 3){
            projectiles.remove(i);
            lives--; 
            playerCollision.play(); 
          
   }
  if (lives <= 0) 
    stage = 3; // gameOver

  }
  fill (255); 
  
  if (lives == 3) //models for the thing 
    super.show(play.getX(), play.getY(), model[0]); 
  else if (lives == 2)
    super.show(play.getX(), play.getY(), model[1]); 
  else if (lives == 1)
    super.show(play.getX(), play.getY(), model[2]); 
}
  
void keyPressed(){
    if (keyPressed && keyCode == LEFT) 
      super.updatePosX(-1 * size/4);  
    else if (keyPressed && keyCode == RIGHT)
      super.updatePosX(size/4); 
    if (keyPressed && keyCode == 32) {
       //     Projectile.add(new Projectile(this.getX(), this.getY()));
            shoot(); 
            projectileLaunch.play(); 
  }

}

  int getLives() {
    return lives; } //because lives is private! 
    

  void shoot(){
    if (bull == null) 
      bull = new Projectile (this); 
  }
  
}
