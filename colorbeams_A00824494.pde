// Jose Elias Garza Vazquez - A00824494
float[] sunCenter = new float[2], polarCoord1 = new float[2], polarCoord2 = new float[2];
float r;
int beamsQuantity = 20;

float[] polarToCartesian(float[] coords) {
  float[] cartCoord = {coords[0] * cos(coords[1]), coords[0] * sin(coords[1])};
  return cartCoord;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      beamsQuantity++;
    } else if (keyCode == DOWN && beamsQuantity > 0) {
      beamsQuantity--;
    } 
  }
}

void setup() {
  size(1000, 1000, P3D);
}

void draw() {
  noStroke();
  translate(width / 2, height / 2, 0);
  
  color black = color(0, 0, 0);
  color white = color(255, 255, 255);
  
  background(black);
  
  sunCenter[0] = 0;
  sunCenter[1] = 0;
  
  lights();
  fill(white);
  sphere(height / 8);
  
  for(float i = 0.0; i < 2 * PI; i += (2 * PI) / beamsQuantity) {
    float r = sqrt(pow(width, 2) + pow(height, 2)) / 4;
    
    polarCoord1[0] = polarCoord2[0] = r;
    polarCoord1[1] = i;
    polarCoord2[1] = i + PI / beamsQuantity;
    
    float[] c1 = polarToCartesian(polarCoord1), c2 = polarToCartesian(polarCoord2);
    
    fill(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
    triangle(mouseX - width / 2, mouseY - height / 2, 
             c1[0], c1[1], 
             c2[0], c2[1]
    );
  
    textSize(40);
    text("Press UP for more beams and DOWN for less of them.\nBeams: " + str(beamsQuantity), 
         10 - width / 2, 
         40 - height / 2);
  }
}
