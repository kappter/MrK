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
	// BMW Logo Example
	
	// outer circle
	stroke(#A1A4A9);
	strokeWeight(5);
	fill(#C8CBD0);
	ellipse(300, 300, 500, 500);
	
	// Inner black circle
	stroke(0);
	strokeWeight(1);
	fill(#5F6062);
	strokeWeight(5);
	ellipse(300, 300, 477, 477);
	
	// Inner blue and white arcs
	fill(255);
	arc(300, 300, 260, 260, 0, PI*2);
	
	fill(#0288C7);
	arc(300, 300, 260, 260, 0, HALF_PI);
	
	fill(#0288C7);
	arc(300, 300, 260, 260, PI, TWO_PI-PI/2);
	
	// Lines in the center
	stroke(#A1A4A9);
	strokeWeight(5);
	line(175, 300, 425, 300);
	line(300, 175, 300, 425);
	
	// BMW text
	// The letter M
	fill(0);
	textSize(125);
	text("M", 250, 160);
	fill(250);
	textSize(120);
	text("M", 250, 160);
	
	// The letter M
	fill(0);
	translate(width/2, height/2);
	rotate(PI/10.0);
	textSize(125);
	text("B", 125, 200);
	fill(250);
	textSize(120);
	text("B", 125, 200);


	
	println("Hello ErrorLog!");
}