public class Spaceship {
  private PVector position; 
  private PVector velocity; 
  
  public Spaceship (float posx, float posy, float intivx, float intivy) {
    position = new PVector (posx, posy); 
    velocity = new PVector (intivx, intivy); 
  }
  void update (){
    position.add(velocity); 
  }
  boolean checkCollision(Spaceship another) { 
    return (this.position.equals(another.position));  // which one should I kill? 
  }
  
  void changeVelocity (PVector velocity){
    this.velocity = velocity; 
   }
  
  public float getX (){
    return position.x;  
  }
  public float getY(){
    return position.y; 
  }

}
