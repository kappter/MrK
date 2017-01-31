XML xml;
String names;

void setup() {
  //size(640,960); //iPhone resolution
  size(300, 560);
  xml = loadXML("wordParts.xml");
  XML[] children = xml.getChildren("suffix");

  for (int i = 0; i < children.length; i++) {
    int id = children[i].getInt("id");
    String coloring = children[i].getString("value");
    String name = children[i].getContent();
    println(id + ", " + coloring + ", " + name);
    names = id + ", " + coloring + ", " + name;
  }
}

void draw() {
  background(55);
  fill(255);
  rectMode(CENTER);
  rect(width/2, height*0.08, width*0.9, height*0.1, 10);
  fill(0);
  text(names, 70, 70, 100, 100);
}
