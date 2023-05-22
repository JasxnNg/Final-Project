public class Kernel {
  private float[][]kernel;

  public Kernel(float[][]init) {
    kernel = init; 
  }

  color calcNewColor(PImage img, int x, int y) {
      color newColor; 
      float r  = 0.0; 
      float g = 0.0; 
      float b = 0.0; 

      for (int i = -1; i < 2; i++) 
        for (int j = -1; j < 2; j++) {
          if (x + i < img.width && y + j < img.height && x + i > 0 && y + j > 0) {
              newColor = img.get(x + i, y + j); 
          }
          
          else{
            newColor = color(0,0,0); } //else... that is the part of the kernel is outside of the range
            r += red(newColor) * kernel [j + 1][i + 1]; //applies this conversion everywhere ! 
            g += green(newColor) * kernel [j + 1][i + 1]; 
            b += blue(newColor) * kernel [j + 1][i + 1];
        }
      r = constrain(r, 0, 255); 
      g = constrain (g, 0, 255); 
      b = constrain (b, 0, 255); 
      return color ((int)r, (int)g, (int)b); 
        
     
    
    
      } 

  void apply(PImage source, PImage destination) {
    
    for (int i = 0; i < source.height; i++) 
      for (int j = 0; j < source.width; j++) 
        destination.pixels[(i * source.width) + j] = calcNewColor (source, j, i); 
    
  }

} 
