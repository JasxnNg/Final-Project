
public class Projectile extends Spaceship {
    private color col; 
    
    public Projectile (float posx, float posy, color col) {
      super( posx, posy, 0, size/4);// moves at a rate of 1/4 a unit a second 
      this.col = col;  //color of the projectile 
}
    public Projectile (Player ply) {// should have the player/ ply
      super (ply.getX() + 20, ply.getY() - 20, 0, -1 * size /1.5);
      col = color (23, 149, 232); //moving upward
  }
  public void update() {
    super.update();
    show(); }

    public void show() {
      fill (col); 
      rect(this.getX(), this.getY(), 10, size /2); }
}
