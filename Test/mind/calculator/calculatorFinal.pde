/*************************************************************************
*  Basic Calculator: By Ken Kapptie | Copyright 2013                     *
*  Goal: to teach OOP to high school students while creating something   *
*        useful and highly customizable that runs on most OS's.          *
*  TODO: 1. Employ response to keyboard digit entry that corresponds to  *
*           keypad or keyboard numeric data.                             *
*        2. Small graphing feature                                       *
*        3. Math functions to add: pow, round, log, exp,                 *
**************************************************************************/

// Instantiate each of the classification of buttons
CalcButton[] numButtons = new CalcButton[10];
CalcButton[] opButtons = new CalcButton[13];
CalcButton[] spButtons = new CalcButton[1];
 
String displayValue = "0";
String valueToCompute = "";  // string value left of operator
String valueToCompute2 = ""; // string value right of operator
float valueToComputeI = 0;   // float value left of operator
float valueToComputeI2 = 0;  // float value right of operator
float result = 0;
char opValue;
boolean firstNum;
 
void setup() {
  size(340,330);
  background(119,127,125);
  frameRate(10);
  noFill();
  strokeWeight(3);
  stroke(200);
  rect(1,1,337,327);
 
  // Populate number buttons
  numButtons[0] = new CalcButton(10,275,100,45,177).asNumber(0);
  numButtons[1] = new CalcButton(10,220,45,45,177).asNumber(1);
  numButtons[2] = new CalcButton(65,220,45,45,177).asNumber(2);
  numButtons[3] = new CalcButton(120,220,45,45,177).asNumber(3);
  numButtons[4] = new CalcButton(10,165,45,45,177).asNumber(4);
  numButtons[5] = new CalcButton(65,165,45,45,177).asNumber(5);
  numButtons[6] = new CalcButton(120,165,45,45,177).asNumber(6);
  numButtons[7] = new CalcButton(10,110,45,45,177).asNumber(7);
  numButtons[8] = new CalcButton(65,110,45,45,177).asNumber(8);
  numButtons[9] = new CalcButton(120,110,45,45,177).asNumber(9);
 
 
  // Populate operators
  opButtons[0] = new CalcButton(175,220,45,45,133).asOperator("+");
  opButtons[1] = new CalcButton(175,165,45,45,133).asOperator("-");
  opButtons[2] = new CalcButton(175,110,45,45,133).asOperator("×");
  opButtons[3] = new CalcButton(175,55,45,45,133).asOperator("÷");
  opButtons[4] = new CalcButton(175,275,100,45,133).asOperator("=");
  opButtons[5] = new CalcButton(10,55,45,45,#d19955).asOperator("C");
  opButtons[6] = new CalcButton(65,55,45,45,133).asOperator("±");
  opButtons[7] = new CalcButton(120,55,45,45,133).asOperator("%");
  opButtons[8] = new CalcButton(230,220,45,45,133).asOperator("√");
  opButtons[9] = new CalcButton(230,55,45,45,133).asOperator("Sin");
  opButtons[10] = new CalcButton(230,110,45,45,133).asOperator("Cos");
  opButtons[11] = new CalcButton(230,165,45,45,133).asOperator("Sq");
  opButtons[12] = new CalcButton(285,55,45,45,133).asOperator("Pow");

  // Populate special buttons
  spButtons[0] = new CalcButton(120, 275,45,45,133).asSpecial(".");
 
  // Set the initial value of first num to true
  firstNum = true;
}
 
void draw() {
  // Draw number buttons
  for (int i=0; i<numButtons.length; i++) {
    CalcButton inumButton = numButtons[i];
    inumButton.display();
  }
  
  for (int i=0; i<opButtons.length; i++) {
    CalcButton iopButton = opButtons[i];
    iopButton.display();
  }
  
  for (int i=0; i<spButtons.length; i++) {
    CalcButton ispButton = spButtons[i];
    ispButton.display();
  }
  updateDisplay();
}
 
void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    CalcButton inumButton = numButtons[i];
    inumButton.clickButton();
    if (inumButton.overBox) {
      if (firstNum) {
        println(i + " " + inumButton.numButtonValue);
        valueToCompute += int(inumButton.numButtonValue);
        displayValue = valueToCompute;
      } else {
        valueToCompute2 += int(inumButton.numButtonValue);
        displayValue = valueToCompute2;
      }
    }
  }
  
  for(int i=0; i<opButtons.length; i++){
    CalcButton iOpButton = opButtons[i];
    iOpButton.clickButton();
    if(iOpButton.overBox) { 
      if(iOpButton.opButtonValue == "C") {
        handleKeyPressOp("C");
      } else if(iOpButton.opButtonValue == "=") {
        // Perform calculation
        handleKeyPressOp("=");
      } else if (iOpButton.opButtonValue == "+"){
        handleKeyPressOp("+");
      } else if (iOpButton.opButtonValue == "-"){
        handleKeyPressOp("-");
      } else if (iOpButton.opButtonValue == "×"){
        handleKeyPressOp("*");
      } else if (iOpButton.opButtonValue == "÷"){
        handleKeyPressOp("/");
      } else if (iOpButton.opButtonValue == "±"){
        opValue = 'n';
        performCalculation();
      } else if (iOpButton.opButtonValue == "%"){
        opValue = '%';
        performCalculation();
      } else if (iOpButton.opButtonValue == "√"){
        opValue = 's';
        performCalculation();
      } else if (iOpButton.opButtonValue == "Sin"){
        opValue = 'i';
        performCalculation();
      } else if (iOpButton.opButtonValue == "Cos"){
        opValue = 'c';
        performCalculation();
      } else if (iOpButton.opButtonValue == "Sq"){
        opValue = 'q';
        performCalculation();
      } else if (iOpButton.opButtonValue == "Pow"){
        opValue = 'p';
        performCalculation();
      }
    }
  }
  
  for (int i=0; i<spButtons.length; i++){
    CalcButton iSpButton = spButtons[i];
    iSpButton.clickButton();
    // concantenate the values clicked on
    if(iSpButton.overBox && mousePressed == true && firstNum == true) {
        valueToCompute = valueToCompute + spButtons[i].spButtonValue;
        displayValue = valueToCompute;
    } else if (iSpButton.overBox && mousePressed == true && firstNum == false) {
      valueToCompute2 = valueToCompute2 + spButtons[i].spButtonValue;
        displayValue = valueToCompute2;
    }
  }
}
  
void performCalculation() {
  // set string values to integers
  valueToComputeI = float(valueToCompute);
  valueToComputeI2 = float(valueToCompute2);
 
  // perform calculation based on the appropriate operator
  if (opValue == '+') {
    result = valueToComputeI + valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '-') {
    result = valueToComputeI - valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '*') {
    result = valueToComputeI * valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '/') {
    result = valueToComputeI / valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == 'p') {
    result = pow(valueToComputeI,valueToComputeI2);
    displayValue = str(result);
  }  else if (opValue == 'n') {
    if (firstNum) {
      valueToComputeI = valueToComputeI*-1;
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2*-1; 
      displayValue = str(valueToComputeI);
    } 
  } else if (opValue == '%') {
    if (firstNum) {
      valueToComputeI = valueToComputeI*0.010000000;
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2*0.01000000; 
      displayValue = str(valueToComputeI);
    } 
  } else if (opValue == 's') {
    if (firstNum) {
      valueToComputeI = sqrt(valueToComputeI);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = sqrt(valueToComputeI2); 
      displayValue = str(valueToComputeI);
    } 
  } else if (opValue == 'i') {
    if (firstNum) {
      valueToComputeI = sin(valueToComputeI);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = sin(valueToComputeI2); 
      displayValue = str(valueToComputeI);
    } 
  } else if (opValue == 'c') {
    if (firstNum) {
      valueToComputeI = cos(valueToComputeI);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = cos(valueToComputeI2); 
      displayValue = str(valueToComputeI);
    } 
  } else if (opValue == 'q') {
    if (firstNum) {
      valueToComputeI = sq(valueToComputeI);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = sq(valueToComputeI2); 
      displayValue = str(valueToComputeI);
    } 
  }
  // let = work multiple times
  if (firstNum) {
    valueToCompute = displayValue;
  } else {
    valueToCompute = displayValue;
    valueToCompute2 = "";
  }
}
 
void updateDisplay() {
  fill(200,200,150);
  rect(10,10,320,35,7);
  fill(0);
  textSize(25);
  text(displayValue,20,37);
}
 
void keyPressed() {
  if (key == '1') {
    handleKeyPressNum("1");
  } else if (key == '2'){
    handleKeyPressNum("2");
  } else if (key == '3'){
    handleKeyPressNum("3");
  } else if (key == '4'){
    handleKeyPressNum("4");
  } else if (key == '5'){
    handleKeyPressNum("5");
  } else if (key == '6'){
    handleKeyPressNum("6");
  } else if (key == '7'){
    handleKeyPressNum("7");
  } else if (key == '8'){
    handleKeyPressNum("8");
  } else if (key == '9'){
    handleKeyPressNum("9");
  } else if (key == '0'){
    handleKeyPressNum("0");
  } else if (key == '=' || keyCode == RETURN || keyCode == ENTER) {
    handleKeyPressOp("=");
  } else if (key == '+') {
    handleKeyPressOp("+");
  } else if (key == '-') {
    handleKeyPressOp("-");
  } else if (key == '*') {
    handleKeyPressOp("*");
  } else if (key == '/') {
    handleKeyPressOp("/");
  } else if (key == ESC) {
    handleKeyPressOp("C");
  }
}

void handleKeyPressNum(String keyPress) {
  if (firstNum) {
    valueToCompute += keyPress;
    displayValue = valueToCompute;
  } else {
    valueToCompute2 += keyPress;
    displayValue = valueToCompute2;
  } 
}

void handleKeyPressOp(String keyPress) {
  if (keyPress == "C") {
    displayValue = "0";
    opValue = 'C';
    valueToCompute = "";
    valueToCompute2 = "";
    valueToComputeI = 0;
    valueToComputeI = 0;
    result = 0;
    firstNum = true;
  } else if(keyPress == "=") {
    // Perform calculation
    firstNum = true;
    performCalculation();
  } else if (keyPress == "+"){
    if (result != 0) {
      opValue = '+';
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "+";
    } else {
      opValue = '+';
      firstNum = false;
      displayValue = "+";
    }
  } else if (keyPress == "-"){
    if (result != 0) {
      opValue = '-';
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "-";
    } else {
      opValue = '-';
      firstNum = false;
      displayValue = "-";
    }
  } else if (keyPress == "*"){
    if (result != 0) {
      opValue = '*';
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "×";
    } else {
      opValue = '*';
      firstNum = false;
      displayValue = "×";
    }
  } else if (keyPress == "/"){
    if (result != 0) {
      opValue = '/';
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "÷";
    } else {
      opValue = '/';
      firstNum = false;
      displayValue = "÷";
    }
  }
}
class CalcButton {
  // Class variables
  boolean isNumber;
  boolean isSpecial;
  float numButtonValue;
  String opButtonValue;
  String spButtonValue;
  float xpos;
  float ypos;
  int buttonW;
  int buttonH;
  boolean overBox = false;
  color buttonC;
 
  // Constructor
  CalcButton(float tempXpos, float tempYpos, int tempButtonW, int tempButtonH, color tempButtonC) {
    xpos = tempXpos;
    ypos = tempYpos;
    buttonW = tempButtonW;
    buttonH = tempButtonH;
    buttonC = tempButtonC;
    //println(numButtonValue);
  }
  
  CalcButton asNumber(float tempNumButtonValue) {
    isNumber = true;
    numButtonValue = tempNumButtonValue;
    return this;
  }
  CalcButton asOperator(String tempOpButtonValue) {
    opButtonValue = tempOpButtonValue;
    return this;
  }
  CalcButton asSpecial(String buttonValue) {
    isSpecial = true;
    spButtonValue = buttonValue;
    return this;
  }
 
  // Draw the button on the canvas
  void display() {
    // Draw rounded edged button on canvas
    if(isNumber) {
      fill(buttonC);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(122,44,22);
      textSize(24);
      text(int(numButtonValue), xpos+15, ypos+30);
    } else if (isSpecial) {
      fill(buttonC);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(0);
      textSize(24);
      text(spButtonValue, xpos+15, ypos+30);
    } else if (opButtonValue == "+/-") {
      fill(buttonC);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(0);
      textSize(18);
      text(opButtonValue, xpos+8, ypos+30);
    } else if (opButtonValue == "%") {
      fill(buttonC);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(0);
      textSize(24);
      text(opButtonValue, xpos+12, ypos+30);
    } else if (opButtonValue == "Sqrt") {
      fill(buttonC);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(0);
      textSize(17);
      text(opButtonValue, xpos+6, ypos+35);
    } else if (opButtonValue == "Sin") {
      fill(buttonC);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(0);
      textSize(19);
      text(opButtonValue, xpos+8, ypos+30);
    } else if (opButtonValue == "Cos") {
      fill(133);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(0);
      textSize(19);
      text(opButtonValue, xpos+7, ypos+30);
    } else if (opButtonValue == "-") {
      fill(buttonC);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(0);
      textSize(24);
      text(opButtonValue, xpos+18, ypos+30);
    } else if (opButtonValue == "Sq") {
      fill(buttonC);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(0);
      textSize(19);
      text(opButtonValue, xpos+12, ypos+30);
    } else if (opButtonValue == "C") {
      fill(buttonC);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(0);
      textSize(24);
      text(opButtonValue, xpos+11, ypos+30);
    } else if (opButtonValue == "Pow") {
      fill(buttonC);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(0);
      textSize(18);
      text(opButtonValue, xpos+5, ypos+30);
    }  else {
      fill(buttonC);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(0);
      textSize(24);
      text(opButtonValue, xpos+15, ypos+30);
    }
  }
 
  // Handle mouse actions
  void clickButton() {
    overBox = mouseX > xpos && mouseX < xpos+buttonW && mouseY > ypos && mouseY < ypos+buttonH;
  }
}

