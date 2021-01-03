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

  //Plan(this.title, this.subtitle, this.description, this.deadline, this.color, this.finished, this.dateAdded);



  /**
   * getter functions for Plan
   */

  String getDescription() {
    return description;
  }

  String getSubTitle() {
    return subtitle;
  }

  String getTitle() {
    return title;
  }




  /**
   * setter functions for Plan
   */

  void setDescription(String value) {
    description = value;
  }

  void setSubtitle(String value) {
    subtitle = value;
  }

  void setTitle(String value) {
    title = value;
  }




}
