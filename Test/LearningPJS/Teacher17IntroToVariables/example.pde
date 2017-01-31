int x = 10;
float y = 50;
float z;

void setup(){
	size(600, 600);
	smooth();
	//background(#999999);
	//fill(255);
	//noLoop();
	PFont fontA = loadFont("arial");
	textFont(fontA, 9); 
	
	// Assign a new value to an existing variable
	y = height;
  
	// Casting a variable
	float randomFloat = random(10);
  	println("randomFloat = " + randomFloat);
  
  	int randomInt = int(random(11));
  	println("randomInt = " + randomInt);
  
  	int randomDie = int(random(6)) + 1;
  	println("randomDie = " + randomDie);
  
  	z = 3*x + atan(sqrt(y));
  	println("z = " + z);
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
	//Intro to variables
	//background(#333333);
	ellipse(x, y, 40, 40);
  
	x++;
  	y *= 0.99;
  
  	x = constrain(x, 0, width/2);
	
	println("Hello ErrorLog!");
}