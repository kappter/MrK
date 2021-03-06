Switch[] theSwitches = new Switch[8];

void setup() {
  size(1250, 500);
  strokeWeight(3);
  textSize(32);

  for (int i = 0; i < theSwitches.length; i++) {
    theSwitches[i] = new Switch(50+i*150, 100, theSwitches.length-i-1);
    //println(theSwitches.length-i-1); // Uncomment to see what it is doing
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
      /* The part that says: (int)pow(2, iSwitch.binValue)
       produces the sequence of powers of two your switches represent
       pow(2, x) produces 2 to some power
       The (int) part shows it without decimal information */
      text((int)pow(2, iSwitch.binValue), iSwitch.x+35, iSwitch.y-19); 
      text("1", iSwitch.x+40, iSwitch.y+285);
    }
    else {
      text("0", iSwitch.x+40, iSwitch.y-19);
      text("0", iSwitch.x+35, iSwitch.y+285);
    }
  }

  // I moved these here so they are displayed once per frame
  fill(#FF1010);
  text("Decimal Value = Top Numbers Added Together", 280, 440);
  text("Binary value is represented by the 1's and 0's at the bottom...", 150, 490);
  fill(#1010BB);
  text("Counting in Binary... Click on the Switches", 300, 40);
}

void mousePressed() {
  if (mouseY > 100 && mouseY < 350) {
    for (int i = 0; i < theSwitches.length; i++) {
      if (mouseX > 50+i*150 && mouseX < (i+1)*150) {
        theSwitches[i].on = !theSwitches[i].on;
      }
    }
  }
}

