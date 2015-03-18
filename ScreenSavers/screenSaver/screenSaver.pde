
Lines[] myLines = new Lines[10];

void setup() {
  frameRate(20);
  background(25);
  size(600, 400, P3D);
  for (int i = 0; i < myLines.length; i++) {
    myLines[i] = new Lines(random(width), random(height), random(-100, -50), random(255), random(255), random(255), random(2, 20));
  }
}

void draw() {
  
  for (int i = 0; i < myLines.length; i++) {
    Lines iLines = myLines[i];
    iLines.display();
  }

  if (frameCount >= 500) {
    background(25);
    frameCount = 0;
  }

}

