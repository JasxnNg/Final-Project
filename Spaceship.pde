public class Spaceship {
  private PVector position; 
  public PVector velocity; 
  
  public Spaceship (float posx, float posy, float vx, float vy) {
    position = new PVector (posx, posy); 
    velocity = new PVector (vx, vy); 
  }
  public void update (){
    position.add(velocity.copy()); 
  }
  
  
  public float getX (){
    return position.x;  
  }
  public float getY(){
    return position.y; 
  }
  
  public void updatePosY(float posit){
    this.position.y += posit; }
  public void updatePosX(float posit){
    this.position.x+= posit;}
    
  public void show (float x, float y, int[][] sprite){
      for (int i = 0; i < sprite.length; i ++ ) { 
        for (int j = 0; j < sprite[i].length; j++){
          if (sprite[i][j] == 1){
            float newX = x + j * 5;
            float newY = y + i * 5;
            rect(newX, newY, 5, 5); 
          }
  }
}
  }
}
