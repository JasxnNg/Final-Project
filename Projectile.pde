public class Projectile extends Spaceship {
    public Projectile (float posx, float posy) {
      super( posx, posy, 0, 2); //inity should be some constant 2 is a placeholder 
  }
    public Projectile (Player ply) {// should have the player/ ply
      super (ply.getX(), ply.getY(), 0, -2); //moving upward
  }
}
