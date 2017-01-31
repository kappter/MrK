// Initialize XML 
XMLElement xmlPrefixes;
XMLElement xmlRoots;
XMLElement xmlSuffixes;

String preNames;
String rootNames;
String sufNames;
String newWord;
String newDefinition;

void setup() {
  size(330, 550);
  xmlPrefixes = new XMLElement(this, "wordPartsPrefixes.xml");
  int indexP = int(random(xmlPrefixes.getChildrenCount()));// int(random(prefixes.length));
  XMLElement kidPre = xmlPrefixes.getChild(indexP);
  int idPre = kidPre.getInt("id");
  String preDefinition = kidPre.getString("prevalue");
  String preName = kidPre.getContent();
  
  xmlRoots = new XMLElement(this, "wordPartsRoots.xml"); 
  int indexR = int(random(xmlRoots.getChildrenCount()));// int(random(prefixes.length));
  XMLElement kidRoot = xmlPrefixes.getChild(indexR);
  int idRoot = kidRoot.getInt("id");
  String rootDefinition = kidRoot.getString("rootvalue");
  String rootName = kidRoot.getContent();
  
  xmlSuffixes = new XMLElement(this, "wordPartsSuffixes.xml");
    int indexS = int(random(xmlSuffixes.getChildrenCount()));// int(random(prefixes.length));
  XMLElement kidSuf = xmlSuffixes.getChild(indexS);
  int idSuf = kidSuf.getInt("id");
  String sufDefinition = kidSuf.getString("sufvalue");
  String sufName = kidSuf.getContent();
}

void draw() {
  background(55);
  getNewWord();
}

void getNewWord() {
  fill(255);
  stroke(122);
  strokeWeight(3);
  rectMode(CENTER);
  rect(width/2, height*0.15, width*0.9, height*0.12, 10);
  rect(width/2, height*0.55, width*0.9, height*0.5, 10);
  rect(width/2, height*0.9, width*0.9, height*0.08, 10);
  
  newWord = preName + rootName + sufName;
  newDefinition =  sufDefinition + preDefinition + rootDefinition;
  
  fill(0);
  textSize(20);
  text(newWord, width/2, height*0.29, width*0.8, height*0.33);
  text(newDefinition, width/2, height*0.5, width*0.8, height*0.33);
  fill(255,10,10);
  text("Click for New Word", width/1.59, height*0.92, width*0.8, height*0.1);
  fill(255);
  textSize(24);
  text("Random Word:", width/2.2, height*0.07, width*0.8, height*0.1);
  text("Definition:", width/2.2, height*0.28, width*0.8, height*0.1);
  noLoop();
}

void mouseReleased() {
  if (mouseX < width*0.95 && mouseY > height*0.87) {
    redraw();
  }
}
