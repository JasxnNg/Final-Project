
public class Projectile extends Spaceship {
    color col; 
    public Projectile (float posx, float posy, color col) {
      super( posx, posy, 0, size/4);//inity should be some constant 2 is a placeholder 
      this.col = col;  
}
    public Projectile (Player ply) {// should have the player/ ply
      super (ply.getX(), ply.getY(), 0, -1 * size /2);
      col = color (23, 149, 232); //moving upward
  }

    public void show() {
      fill (col); 
      rect(this.getX(), this.getY(), 10, size); }
}
