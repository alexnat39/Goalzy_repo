import 'dart:ui';

class Idea {
  String _title;
  String _subtitle;
  String _description;
  Color _color;
  final DateTime _dateAdded;

  /**
   * getter functions
   */
  Idea(this._title, this._subtitle, this._description, this._color, this._dateAdded);


  Color get color => _color;

  String getDescription() {
    return _description;
  }
  String getTitle() {
    return _title;
  }
  String getSubtitle() {
    return _subtitle;
  }

  DateTime get dateAdded => _dateAdded;

  /**
   * setter functions
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
}
