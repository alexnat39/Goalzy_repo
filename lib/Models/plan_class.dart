import 'dart:ui';

class Plan {
  int id;
  String title;
  String subtitle;
  String description;
  String deadline;
  int color;
  int finished;
  String dateAdded;

  planMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['title'] = title;
    mapping['subtitle'] = subtitle;
    mapping['description'] = description;
    mapping['deadline'] = deadline;
    mapping['color'] = color;
    mapping['finished'] = finished;
    mapping['dateAdded'] = dateAdded;

    return mapping;
  }


}
