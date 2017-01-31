Switch[] theSwitches = new Switch[8];

void setup() {
  size(1250, 500);
  //background(255);
  strokeWeight(3);
  textSize(32);
  
  // Create Switches
  for (int i = 0; i < theSwitches.length; i++) {
    theSwitches[i] = new Switch(50+i*150, 100, i); // Set (x, y)
  }
}

void draw() {
  // See the Switches
  background(255);
  for (int i = 0; i < theSwitches.length; i++) {
    theSwitches[i].display();
  }
}

class Switch {
  boolean on;
  int x, y, binValue;

  Switch(int inX, int inY, int inVal) {
    on = false;
    x = inX;
    y = inY;
    binValue = inVal;
  }

  void display() {
    if (on) fill(50);
    else fill(100);
    rect(x, y, 100, 250);
    if (on) fill(100);
    else fill(50);
    rect(x, y+125, 100, 125);
    fill(225);
    if (on) text("ON", x+29, y+195);
    else text("OFF", x+19, y+75);
    fill(0);
    if (on && binValue == 0) {text("128", x+35, y-19); text("1", x+40, y+285);}
    else if (on && binValue == 1) {text("64", x+35, y-19); text("1", x+40, y+285);}
    else if (on && binValue == 2) {text("32", x+35, y-19); text("1", x+40, y+285);}
    else if (on && binValue == 3) {text("16", x+35, y-19); text("1", x+40, y+285);}
    else if (on && binValue == 4) {text("8", x+35, y-19); text("1", x+40, y+285);}
    else if (on && binValue == 5) {text("4", x+35, y-19); text("1", x+40, y+285);}
    else if (on && binValue == 6) {text("2", x+35, y-19); text("1", x+40, y+285);}
    else if (on && binValue == 7) {text("1", x+35, y-19); text("1", x+40, y+285);}
    else {text(binValue*0, x+40, y-19);text("0", x+35, y+285);}
    text("Decimal Value = Top Numbers Added Together", 280, 440);
    text("Binary value is the 1's and 0's at the bottom...", 300, 490);
    text("Counting in Binary... Click on the Switches", 300, 40);
  }
}

void mousePressed() {
  if (mouseY > 100 && mouseY < 350) { // Y-axis bounds
    for (int i = 0; i < theSwitches.length; i++) { // For all the Switches
      if (mouseX > 50+i*150 && mouseX < (i+1)*150) { // X-axis bounds
        theSwitches[i].on = !theSwitches[i].on; // On / Off toggle
      }
    }
  }
}