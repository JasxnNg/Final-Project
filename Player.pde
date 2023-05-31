

public class Player extends Spaceship{
  private int lives = 3; 
  public Player (float posx, float posy) {
      super( posx, posy, 0, 0); }


void update(){
  // make the size 
  keyPressed(); 
 // if(playerHit(bullets)){
//      lives--;
//      if(lives == 0){
//        stage = 3;
//      }
//  }  //reset the PVector
  if (bull != null && bull.getY() < 0 ) 
    bull = null; 
   for (int i = 0; i < projectiles.size(); i++) {
     if (projectiles.get(i) != null && // just in case! 
         Math.abs(projectiles.get(i).getX() - play.getX()) < size - 3
         && Math.abs(projectiles.get(i).getY() - play.getY())< size - 3){
            projectiles.remove(i);
            lives--; 
          
   }
  if (lives <= 0) 
    gameOver(); 

  }
}
  
void keyPressed(){
    if (keyPressed && keyCode == LEFT) 
      super.updatePosX(-1 * size/4);  
    else if (keyPressed && keyCode == RIGHT)
      super.updatePosX(size/4); 
    if (keyPressed && keyCode == 32) {
       //     Projectile.add(new Projectile(this.getX(), this.getY()));
            shoot(); 
  }

}

  int getLives() {
    return lives; }
    
  void show() {
      fill (255); 
      ellipse(this.getX(), this.getY(), size, size * 1.1); 
  }
  void shoot(){
    if (bull == null) 
      bull = new Projectile (this); 
  }
  
}
