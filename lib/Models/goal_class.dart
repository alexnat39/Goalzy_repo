import 'dart:ui';

import 'package:intl/intl.dart';

class Goal {
  String id;
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

  @override
  String toString() {
    return 'Goal{_id: $id, _title: $title, _subtitle: $subtitle, description $description, _deadline $deadline, _dateAdded $dateAdded, isFinished $finished}';
  }

  String deadlineToDateDeadline() {
    return deadline.substring(0, deadline.indexOf(" "));
  }
}
