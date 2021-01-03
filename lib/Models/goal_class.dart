import 'dart:ui';

import 'package:intl/intl.dart';


class Goal {
  int id;
  String title;
  String subtitle;
  String description;
  String deadline;
  int color;
  int finished;
  String dateAdded;

  goalMap() {

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

  //Goal(this.title, this.subtitle, this.description, this.deadline, this.color, this.finished, this.dateAdded);



  //Color getColor() => color;

  /**
   * getter functions
   */



  String getSubTitle() {
    return subtitle;
  }

  String getDescription() {
    return description;
  }

  String getTitle() {
    return title;
  }


 /// DateTime getDateAdded() => dateAdded;


  /**
   * setter functions
   */


  setDescription(String value) {
    description = value;
  }

  setSubtitle(String value) {
    subtitle = value;
  }

  setTitle(String value) {
    title = value;
  }






  @override
  String toString() {
    return 'Goal{_title: $title, _subtitle: $subtitle, description $description, _deadline $deadline, _dateAdded $dateAdded, isFinished $finished}';
  }
}
