size(600, 600);
smooth();
noStroke();
rectMode(CENTER);
background(50);

int n = 4;
float x = width/(n+1);

//Grayscale fill
fill(116);
rect(x*1, height/2, 100, 100);

//Color
fill(116,100);
rect(x*2, height/2, 100, 100);

//Color
fill(116,173,146);
rect(x*3, height/2, 100, 100);

//RGB with Alpha
fill(116,173,146,100);
rect(x*4, height/2, 100, 100);