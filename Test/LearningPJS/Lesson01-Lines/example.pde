// Ex03_12

size(600, 200);
smooth();
background(#9F9694);
noFill();

// The First Curve
// The control points
stroke(#F1E6D4);
strokeWeight(2);
line(100, 50, 250, 50);
line(100, 150, 250, 150);

// The curve itself
stroke(#791F33);
strokeWeight(3);
bezier(100, 50, 250, 50, 100, 150, 250, 150);

// The Second Curve
// The control points
stroke(#F1E6D4);
strokeWeight(2);
line(350, 75, 500, 25);
line(350, 125, 500, 175);

// The curve itself
stroke(#BA3D49);
strokeWeight(3);
bezier(350, 75, 500, 25, 500, 175, 350, 125);