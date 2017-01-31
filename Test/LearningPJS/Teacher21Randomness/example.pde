void setup() {
	size(600, 600);
	smooth();
	noFill();
	background(255);
	strokeWeight(5);
	frameRate(5);
}

void draw() {
	float x = random(width);
	float y = random(height);
	float d = random(30, 300);
	stroke(random(155), random(155), random(155));
	rect(x, y, d, d);
}