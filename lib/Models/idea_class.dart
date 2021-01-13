import 'dart:ui';

class Idea {
  String id;
  String title;
  String subtitle;
  String description;
  int color;
  String dateAdded;


  ideaMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['title'] = title;
    mapping['subtitle'] = subtitle;
    mapping['description'] = description;
    mapping['color'] = color;
    mapping['dateAdded'] = dateAdded;

    return mapping;
  }
}

