public class Spaceship {
  PVector position; 
  PVector velocity; 
  
  public Spaceship (float posx, float posy, float intivx; float intivy) {
    position = new PVector (posx, posy); 
    velocity = new PVector (intivx; intivy); 
  }
  
  void update() {
    position.add(velocity); 
  }
  
  void changeVelocity (float newvx; float newvy){
    velocity = new PVector (newvx; newvy); 
   }

}
