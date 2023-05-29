PVector dir = new PVector (0,0); 

public class Player extends Spaceship{
  public Player (float posx, float posy, float intivx, float intivy) {
      super( posx, posy, intivx, intivy); }


void update(){
  // make the size 
  if (freeMove)
    super.update();
  else {
    super.update(); //fill 
    //create the border for everything 
  }
  dir = new PVector (0,0); //reset the PVector
  changeVelocity(dir); 
  

}
void keyPressed(){
    if (keyCode == UP) 
      dir = new PVector(0,-1); 
    else if (keyCode == DOWN) 
      dir = new PVector(0,1); 
    else if (keyCode == LEFT) 
      dir = new PVector(-1,0); 
    else if (keyCode == RIGHT)
      dir = new PVector (1,0); 
    changeVelocity(dir); 
  }
}
