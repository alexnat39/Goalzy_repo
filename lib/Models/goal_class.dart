import 'dart:ui';

import 'package:intl/intl.dart';


class Goal {
  String _title;
  String _subtitle;
  String _description;
  DateTime _deadline;
  Color _color;
  bool _finished;
  DateTime _dateAdded;

  Goal(this._title, this._subtitle, this._description, this._deadline, this._color, this._finished, this._dateAdded);

  Color get color => _color;

  /**
   * getter functions
   */

  bool isFinished() => _finished;

  DateTime getDeadline() {
    return _deadline;
  }

  String getSubTitle() {
    return _subtitle;
  }

  String getDescription() {
    return _description;
  }

  String getTitle() {
    return _title;
  }

  DateTime get dateAdded => _dateAdded;


  /**
   * setter functions
   */
  setDeadline(DateTime value) {
    _deadline = value;
  }

  setDescription(String value) {
    _description = value;
  }

  setSubtitle(String value) {
    _subtitle = value;
  }

  setTitle(String value) {
    _title = value;
  }

  setFinished(bool value) {
    _finished = value;
  }


  String dateToString() {
    return DateFormat('MM-dd-yyyy').format(_deadline);
  }

  @override
  String toString() {
    return 'Goal{_title: $_title, _subtitle: $_subtitle, _deadline $_deadline}';
  }
}
