

public class Enemy extends Spaceship{
  private int chanceOfShot = 2000;  
  private int life; 
  private Projectile b; 
  private int[][] sprite = new int[][] {
       {1,0,0,0,0,0,0,0,0,0,1},
       {0,1,0,0,0,0,0,0,0,1,0},
       {0,0,1,1,1,1,1,1,1,0,0},
       {0,1,1,0,1,1,1,0,1,1,0},
       {1,0,1,1,1,1,1,1,1,0,1},
       {1,0,1,1,1,1,1,1,1,0,1},
       {1,0,1,0,0,0,0,0,1,0,1},
       {0,0,1,1,0,0,0,1,1,0,0}
  }; 
  
   public Enemy (int xpos, int ypos) {
     super(xpos, ypos, size/16, 0); 
     life = 2; 
   }
   
   void update() {
    super.update();
    if(random(0, chanceOfShot) < 1){
      shoot();
    }    
    if(this.getX() > width - 4 * size || this.getX() < 2 * size){
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
       score += 10; //gets 10 points if you shoot 
       if (enemies.get(i).life < 1) 
         die(enemies.get(i)); 
       }
        }
     fill (80, 255, 80);
     super.show(this.getX(), this.getY(), sprite); 
  }
     
  
   
   void shoot(){
     b = new Projectile(this.getX(), this.getY(), color (163, 31, 2)); 
     projectiles.add(b); }
    
    
    void die(Enemy i ){
      
      enemies.remove(i);
      score += 40; //gets fifty total if they die  
    }
   

}
