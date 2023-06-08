
 private int chanceOfShot = 2000; 
 
public class Enemy extends Spaceship{ 
  private int life; 
  private Projectile b; 
  // this sprite is unique to the enemy class! 
  private int[][][] model = new int[][][]  {
    
    
    {
       {1,0,0,0,0,0,0,0,0,0,1},
       {0,1,0,0,0,0,0,0,0,1,0},
       {0,0,1,1,1,1,1,1,1,0,0},
       {0,1,1,0,1,1,1,0,1,1,0},
       {1,0,1,1,1,1,1,1,1,0,1},
       {1,0,1,1,1,1,1,1,1,0,1},
       {1,0,1,0,0,0,0,0,1,0,1},
       {0,0,1,1,0,0,0,1,1,0,0}
  },
  
      {
       {1,0,0,0,0,0,0,0,0,0,1},
       {0,1,0,0,0,0,0,0,0,0,0},
       {0,0,0,1,1,1,1,1,1,0,0},
       {0,1,1,0,1,1,1,0,1,1,0},
       {1,0,1,1,0,0,1,1,1,0,1},
       {1,0,0,1,1,0,1,1,1,0,1},
       {1,0,1,0,0,0,0,0,0,0,1},
       {0,0,1,1,0,0,0,1,1,0,0}
  }


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
      //if(this.getX() > width - 4 * size || this.getX() < 2 * size){
      //  for(Enemy i: enemies){
      //    i.velocity.x *= -1;
      //    i.updatePosY(size/2);
      // }
      //} bad fix? need to change where it's a little scuffed and
      // it's a little misaligned
   if(this.getY() > play.getY()){
      gameOver();
    }
    //collision mechanics for this here 
    for (int i = 0; i < enemies.size(); i++) { // cannot use enhanced for-loop 
      if (bull != null && 
          Math.abs(bull.getX() - enemies.get(i).getX()) < size   // its like a sphere for collisions 
          && Math.abs(bull.getY() - enemies.get(i).getY())< size  ){
       bull = null; 
       enemies.get(i).life--;  
       score += 10; //gets 10 points if you shoot 
       enemyCollision.play(); 
       if (enemies.get(i).life < 1) 
         die(enemies.get(i)); 
       }
    if (this.getY()  >= 1000) 
      stage = 3; 
        }
     fill (80, 255, 80);
     if (this.life == 2) 
       super.show(this.getX(), this.getY(), model[0]); 
     else if (this.life == 1) 
       super.show(this.getX(), this.getY(), model[1]); 
  }
     
  
   
   void shoot(){
     b = new Projectile(this.getX(), this.getY(), color (163, 31, 2)); 
     projectiles.add(b); }
    
    
    void die(Enemy i ){
      
      enemies.remove(i);
      score += 40; //gets fifty total if they die  
    }
    
    //void changeThing() {
    //  if(this.getX() > width - 4 * size || this.getX() < 2 * size && change){
    //  for(Enemy i: enemies){
    //    i.velocity.x *= -1;
    //    i.updatePosY(size/2);
    //   }
    //   change = false; 
    //}
    //} this did not work... 
    
   

}
