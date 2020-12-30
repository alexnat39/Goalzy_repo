import 'dart:ui';

class Plan {
  String _title;
  String _subtitle;
  String _description;
  DateTime _deadline;
  Color _color;
  bool _finished;
  final DateTime _dateAdded;

  Plan(this._title, this._subtitle, this._description, this._deadline, this._color, this._finished, this._dateAdded);


  Color get color => _color;

  /**
   * getter functions for Plan
   */
  bool isFinished() => _finished;

  String getDescription() {
    return _description;
  }

  String getSubTitle() {
    return _subtitle;
  }

  String getTitle() {
    return _title;
  }

  DateTime getDeadline() {
    return _deadline;
  }

  DateTime get dateAdded => _dateAdded;

  /**
   * setter functions for Plan
   */

  void setDescription(String value) {
    _description = value;
  }

  void setSubtitle(String value) {
    _subtitle = value;
  }

  void setTitle(String value) {
    _title = value;
  }

  void setDeadline(DateTime value) {
    _deadline = value;
  }

  void setFinished(bool value) {
    _finished = value;
  }

}
