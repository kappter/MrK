color[] rainbow = {#FFFF00, #00FF00, #FF00FF, #FF0000};

size(600, 600);
background(rainbow[0]);
smooth();

strokeWeight(20);
stroke(rainbow[1]);

strokeCap(ROUND);
line(50, height*.25, 550, height*.25);

strokeCap(SQUARE);
line(50, height/2, 550, height/2);

strokeCap(PROJECT);
line(50, height*.75, 550, height*.75);

noFill();
strokeJoin(MITER);
//strokeJoin(BEVEL);
//strokeJoin(ROUND);
rect(100, 50, 100, 100);