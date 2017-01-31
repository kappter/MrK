int n = 150;
int x;
float y = 0.05;
float noiseY;

void setup() {
	size(600, 600);
	background(255);
	stroke(100);
}

void draw() {
	for(int i = 1; i < n; i++) {
		y += 0.02;
		x = i* (width/n);
		noiseY = noise(y) * height;
		line(x, height, x, noiseY);
		
		noLoop();
	}

}