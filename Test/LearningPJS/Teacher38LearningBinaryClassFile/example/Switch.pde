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
  }
}