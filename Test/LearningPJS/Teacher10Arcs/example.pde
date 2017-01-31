void setup(){
	smooth();
	size(600, 600);
	background(#CCCCCC);
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
	//Arcs
	
	// Form for arc(x, y, width, height, start, stop); starts at 3 o'clock
	//arc(100, 100, 75, 75, 0, PI*0.5);
	arc(100, 100, 75, 75, 0, HALF_PI);
	
	noFill();
	arc(233, 100, 75, 75, 0, PI);
	
	stroke(5);
	fill(0, 191, 255);
	noFill();
	arc(367, 100, 75, 75, 0, radians(270));
	
	stroke(0);
	arc(500, 100, 75, 75, 0, TWO_PI);
	
	println("Hello ErrorLog!");
}