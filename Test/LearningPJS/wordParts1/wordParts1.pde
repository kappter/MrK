XMLElement xml;

void setup() {
  size(200, 200);
  xml = new XMLElement(this, "sites.xml");
  int numSites = xml.getChildCount();
  for (int i = 0; i < numSites; i++) {
    XMLElement kid = xml.getChild(i);
    int id = kid.getInt("id"); 
    String url = kid.getString("url"); 
    String site = kid.getContent();
    println(id + " : " + url + " : " + site);    
  }
}
