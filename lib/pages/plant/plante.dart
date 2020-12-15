class Plant {
  String image;
  String plantName;
  String plantCategory;
  String wiki;
  List <Comment>comments;
  List<Chronologie_element>chronology;

  Plant({this.image, this.plantName, this.plantCategory,this.wiki, this.comments, this.chronology});
}

class Chronologie_element {
  String actionName;
  String date;

  Chronologie_element({this.actionName, this.date});
}
class Comment {
  String description;

  Comment({this.description});
}

