float intivx = 30 % speed; 
float intivy = 0; 
public class Enemy extends Spaceship{
   public Enemy (int xpos, int ypos) {
     super(xpos, ypos, intivx, intivy); 
   }
   
   void update() {
     super.update();
     //collision mechanics will be in my driver class 
   }
   

}
