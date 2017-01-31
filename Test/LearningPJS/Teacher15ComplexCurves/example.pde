void setup(){
	smooth();
	size(600, 600);
	background(#999999);
	//fill(255);
	noLoop();
	PFont fontA = loadFont("arial");
	textFont(fontA, 9);  
}

void draw(){ 
	//Horizontal lines for visual aid
	line(0,100,600,100);
	line(0,200,600,200);
	line(0,300,600,300);
	line(0,400,600,400);
	line(0,500,600,500);
	
	//Vertical lines for visual aid
	line(100,0,100,600);
	line(200,0,200,600);
	line(300,0,300,600);
	line(400,0,400,600);
	line(500,0,500,600);
	
	//Column headers for demonstration
	text("100", 92, 10);
	text("200", 192, 10);
	text("300", 292, 10);
	text("400", 392, 10);
	text("500", 492, 10);
	
	//Row headers for demonstration
	text("100", 3, 103);
	text("200", 3, 203);
	text("300", 3, 303);
	text("400", 3, 403);
	text("500", 3, 503);
	
	//Designs for demonstration and activities go HERE!
	//Complex Curves
	
	
	
	
	// black curve
	noFill();
	strokeWeight(3);
	curveTightness(0);
	stroke(0);
	beginShape();
	curveVertex(100, 100);
	curveVertex(100, 100);
	curveVertex(150, 150);
	curveVertex(250, 50);
	curveVertex(300, 10);
	curveVertex(400, 190);
	curveVertex(500, 100);
	curveVertex(500, 100);
	endShape();
	
	// grey curve
	noFill();
	strokeWeight(3);
	curveTightness(-3);
	stroke(100);
	beginShape();
	curveVertex(100, 100);
	curveVertex(100, 100);
	curveVertex(150, 150);
	curveVertex(250, 50);
	curveVertex(300, 10);
	curveVertex(400, 190);
	curveVertex(500, 100);
	curveVertex(500, 100);
	endShape();
	
	// white curve
	noFill();
	strokeWeight(3);
	curveTightness(+4);
	stroke(255);
	beginShape();
	curveVertex(100, 100);
	curveVertex(100, 100);
	curveVertex(150, 150);
	curveVertex(250, 50);
	curveVertex(300, 10);
	curveVertex(400, 190);
	curveVertex(500, 100);
	curveVertex(500, 100);
	endShape();
	
	// red dots
	noFill();
	strokeWeight(8);
	stroke(200, 0, 0);
	point(100, 100);
	point(150, 150);
	point(250, 50);
	point(300, 10);
	point(400, 190);
	point(500, 100);
	
	println("Hello ErrorLog!");
}