//Lines myLines1;
Lines[] myLines = new Lines [20];

void setup() {
  size(960,500);
  background(random(2,12));
  
  frameRate(10);
  //myLines1 = new Lines(random(width),random(height),random(1,5),random(1,20));
  for (int i=0; i<myLines.length; i++) {
    myLines[i] = new Lines(random(width),random(height),random(1,5),random(1,20));
  }
}

void draw() {
  //myLines1.display();
  if (frameCount == 500) {
    frameCount = 0;
    background(random(2,20));
  } else {
    for (int i=0; i<myLines.length; i++) {
      Lines iLines = myLines[i];
      iLines.display();
    }
  }
}


class Lines {
  // class variables
  float xpos;
  float ypos;
  float strokeW;
  float lineLength;
  
  // constructor
  Lines(float tempX, float tempY, float tempStroke, float tempLength) {
    xpos = tempX;
    ypos = tempY;
    strokeW = tempStroke;
    lineLength = tempLength;
  }
  // display
  void display() {
    strokeW = random(1,2);
    lineLength = random(1,38);
    //stroke(random(100,255));
    stroke(random(200),random(100),random(10));
    if(xpos > width || xpos < 0 || ypos > height || ypos < 0) {
      xpos = random(width);
      ypos = random(height);
    } else {
      if (random(100)>90) {
        strokeWeight(strokeW);
        moveLeft(xpos,ypos,lineLength);
      } else if (random(100)>80) {
        strokeWeight(strokeW);
        moveUp(xpos,ypos,lineLength);
      } else if (random(100)>70) {
        strokeWeight(strokeW);
        moveDown(xpos,ypos,lineLength);
      } else if (random(100)>60) {
        strokeWeight(strokeW);
        moveRight(xpos, ypos, lineLength);
      } else if (random(100)>50) {
        strokeWeight(strokeW);
        moveDiagDownLeft(xpos,ypos,lineLength);
      } else if (random(100)>50) {
        strokeWeight(strokeW);
        moveDiagUpLeft(xpos,ypos,lineLength);
      } else if (random(100)>50) {
        strokeWeight(strokeW);
        moveDiagUpRight(xpos,ypos,lineLength);
      } else {
        strokeWeight(strokeW);
        moveDiagDownRight(xpos,ypos,lineLength);
      }
    }
  }
  
  // behavior
  void moveRight(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX+i, startY);
      xpos = startX + i;
      ypos = startY;
    }
  }
  
  void moveLeft(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX-i, startY);
      xpos = startX - i;
      ypos = startY;
    }
  }
  
  void moveUp(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX, startY-i);
      ypos = startY - i;
      xpos = startX;
    }
  }
  
  void moveDown(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX, startY+i);
      ypos = startY + i;
      xpos = startX;
    }
  }
  void moveDiagDownRight(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX+i, startY+i);
      ypos = startY + i;
      xpos = startX + i;
    }
  }
  void moveDiagDownLeft(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX-i, startY+i);
      ypos = startY + i;
      xpos = startX - i;
    }
  }
  void moveDiagUpLeft(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX-i, startY-i);
      ypos = startY - i;
      xpos = startX - i;
    }
  }
  void moveDiagUpRight(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX+i, startY-i);
      ypos = startY - i;
      xpos = startX + i;
    }
  }
}

