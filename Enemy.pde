

public class Enemy extends Spaceship{
  private int chanceOfShot = 2000;  
  private int life; 
  private Projectile b;  
  
   public Enemy (int xpos, int ypos) {
     super(xpos, ypos, size/16, 0); 
     life = 2; 
   }
   
   void update() {
    super.update();
    if(random(0, chanceOfShot) < 1){
      shoot();
    }    
    if(this.getX() > width || this.getX() < 0){
      for(Enemy i: enemies){
        i.velocity.x *= -1;
        i.updatePosY(size/2);
     }
    }
   if(this.getY() > play.getY()){
      gameOver();
    }
    //collision mechanics for this here 
    for (int i = 0; i < enemies.size(); i++) {
      if (bull != null && 
          Math.abs(bull.getX() - enemies.get(i).getX()) < size + 3 
          && Math.abs(bull.getY() - enemies.get(i).getY())< size){
       bull = null; 
       enemies.get(i).life--;  
       if (enemies.get(i).life < 1) 
         die(enemies.get(i)); 
       }
        }
  }
     
  
   
   void shoot(){
     b = new Projectile(this.getX(), this.getY(), color (163, 31, 2)); 
     projectiles.add(b); }
     
    void show () {
      fill (255); 
      ellipse(this.getX(), this.getY(), size, size * 1.1); }
    
    void die(Enemy i ){
      
      enemies.remove(i);
      score += 10; }
   

}
