float eye1xpos;
float eye1ypos;
float eye2xpos;
float eye2ypos;

void setup() {
  size(200,200);
  smooth();
  background(#698279);
  frameRate(0.5);
}

void draw() {
  background(#698279);
  eye1xpos = width*0.33;
  eye1ypos = random(height*0.39,height*0.35);
  eye2xpos = width*0.66;
  eye2ypos = random(height*0.39,height*0.35);
  strokeWeight(height*0.019);
  drawHead();
  drawMouth();
  //drawEyebrows();
  drawNose();
  drawEyes();
  //noLoop();
}

void drawHead() {
  fill(#D1AD63);
  ellipse(width/2,height/2,random(width*0.6,width*0.85),random(height*0.8,height*0.99));
}

void drawEyebrows() {
  line(random(width*0.2,width*0.25),
  random(height*0.2,height*0.25),
  random(width*0.35,width*0.45),
  random(height*0.2,height*0.3));
  
  line(random(width*0.6,width*0.7),
  random(height*0.2,height*0.25),
  random(width*0.7,width*0.75),
  random(height*0.2,height*0.3));
}

void drawMouth() {
  if (random(10)>4){
    bezier(random(width*0.3, width*0.40), random(height*0.60, height*0.80), 
    random(width*0.10, width*0.3), random(height*0.90,height*0.99), 
    random(width*0.6, width*0.7), random(height*0.6,height*0.8), 
    random(width*0.60, width*0.75), random(height*0.70, height*0.80));
  } else {
    fill(0);
    ellipse(random(width*0.4,width*0.55),
    random(height*0.7,height*0.8),
    random(width*0.05,width*0.1),
    random(height*0.05,height*0.1));
  }
}

void drawNose() {
  line(random(width*0.4,width*0.5),height*0.6,width*0.6,height*0.6);
  line(random(width/2,width/1.7),height*0.4,width*0.6,height*0.6);
  //bezier(88, 44, 10, 10, 90, 55, 15, 80);
}

void drawEyes() {
  fill(255);
  ellipseMode(CENTER);
  line(width*0.3,height*0.35,width*0.6,height*0.35);
  ellipse(eye1xpos,eye1ypos,random(width*0.1,width*0.3),random(height*0.1,height*0.3));
  ellipse(eye2xpos,eye2ypos,random(width*0.1,width*0.3),random(height*0.1,height*0.3));
  // Draw eyeballs
  fill(0);
  ellipse(eye1xpos+random(-10,10),eye1ypos,
  random(width*0.01,width*0.03),
  random(height*0.01,height*0.03));
  ellipse(eye2xpos+random(-10,10),eye2ypos,
  random(width*0.01,width*0.03),
  random(height*0.01,height*0.03));
}
class Face {
  
}

