void setup() {
	size(600, 600);
	background(255);
	//smooth();
	stroke(100, 50);
	frameRate(3);
}

void draw() {
	int n = 100;
	float[] xTop = new float[n];
	float[] xBottom = new float[n];
	
	for(int i = 0; i < n; i++) {
  		xTop[i] = random(50, 550);
  		xBottom[i] = random(50, 550);
  		strokeWeight(random(5));
  		stroke(random(100), random(100), random(100), 30);
  		line(xTop[i], 25, xBottom[i], 575);
	}
	noLoop();
}



