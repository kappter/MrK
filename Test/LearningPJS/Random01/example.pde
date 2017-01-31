void setup() {
  size(600, 600);
  background(#698279);
  frameRate(20);
}

void draw() {
  float r = random(255);
  //background(#698279);
  strokeWeight(5);
  
  if (mousePressed == true) {
    line(mouseX, mouseY, mouseX/r, mouseY/r);
    fill(r);
    stroke(000);
    ellipse(mouseX, mouseY, r/2, r/2);
  } else {
      line(mouseX, mouseY, mouseX/r, mouseY/r);
      fill(000);
      stroke(255);
      ellipse(mouseX, mouseY, r/2, r/2);
  }
  

}