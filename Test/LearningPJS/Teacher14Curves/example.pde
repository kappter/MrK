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
	//Curves
	
	stroke(#442412);
	strokeWeight(5);
	curve(100, 300, 100, 100, 200, 100, 200, 300);
	
	noFill();
	stroke(#B9961C);
	curveTightness(3);
	curve(250, 300, 250, 100, 350, 100, 350, 300);
	
	noFill();
	stroke(#475D1C);
	curveTightness(-3);
	curve(400, 300, 400, 100, 500, 100, 500, 300);
	
	println("Hello ErrorLog!");
}