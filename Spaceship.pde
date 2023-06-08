public class Spaceship {
  private PVector position; 
  private PVector velocity; 
  
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
    public void updateVelocityX(float posit){
    this.velocity.x *= posit; }

    
  public void show (float x, float y, int[][] model){
      for (int i = 0; i < model.length; i ++ ) { 
        for (int j = 0; j < model[i].length; j++){
          if (model[i][j] == 1){
            float newX = x + j * 5;
            float newY = y + i * 5;
            rect(newX, newY, 5, 5); 
          }
  }
}
  }
}
