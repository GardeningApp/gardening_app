class Plant {
  String image;
  String plantName;
  String plantCategory;
  String wiki;
  List<Chronologie_element>chronology;

  Plant({this.image, this.plantName, this.plantCategory, this.wiki, this.chronology});
}

class Chronologie_element {
  String actionName;
  String date;

  Chronologie_element({this.actionName, this.date});
}

