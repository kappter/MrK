Switch[] theSwitches = new Switch[32];
long decimalVal;

void setup() {
  size(1950, 220);
  strokeWeight(3);
  textSize(10);
  decimalVal = 0;

  for (int i = 0; i < theSwitches.length; i++) {
    theSwitches[i] = new Switch(20+i*60, 40, theSwitches.length-i-1);
  }
}

void draw() {
  background(255);

  // An advantage of the loop is making a lot of if statements on general one :)
  for (int i = 0; i < theSwitches.length; i++) {
    // The current Switch of the loop (arbitraily named iSwitch)
    Switch iSwitch = theSwitches[i];

    iSwitch.display();

    if (iSwitch.on) {
      text((int)pow(2, iSwitch.binValue), iSwitch.x+14, iSwitch.y-6); 
      text("1", iSwitch.x+16, iSwitch.y+119);
    }
    else {
      text("0", iSwitch.x+16, iSwitch.y-6);
      text("0", iSwitch.x+14, iSwitch.y+119);
    }
  }

  // I moved these here so they are displayed once per frame
  fill(#FF1010);
  text("Decimal Value = " + decimalVal, 20, 176);
  text("Binary value is represented by the 1's and 0's at the bottom...", 20, 196);
  fill(#1010BB);
  text("Counting in Binary... Click on the Switches", 20, 16);
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
    rect(x, y, 40, 100);
    if (on) fill(100);
    else fill(50);
    rect(x, y+50, 40, 50);
    fill(225);
    if (on) text("ON", x+10, y+78);
    else text("OFF", x+8, y+30);
    fill(0);
  }
}

int updateDecVal(int value) {
  decimalVal = decimalVal + value;
  return value;
}

void mousePressed() {
  if (mouseY > 40 && mouseY < 140) {
    for (int i = 0; i < theSwitches.length; i++) {
      if (mouseX > 20+i*60 && mouseX < (i+1)*60) {
        theSwitches[i].on = !theSwitches[i].on;
        if (theSwitches[i].on) {
          decimalVal += updateDecVal((int)pow(2, theSwitches[i].binValue));
        }else {
          decimalVal -= updateDecVal((int)pow(2, theSwitches[i].binValue));
        }
      }
    }
  }
}

