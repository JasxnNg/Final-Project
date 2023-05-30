public class Spaceship {
  private PVector position; 
  public PVector velocity; 
  
  public Spaceship (float posx, float posy, float vx, float vy) {
    position = new PVector (posx, posy); 
    velocity = new PVector (vx, vy); 
  }
  void update (){
    position.add(velocity.copy()); 
  }
  boolean checkCollision(Spaceship another) { 
    return (this.position.equals(another.position));  // which one should I kill? 
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

}
