class Class {
  late final String _name;
  late final String _id;
  late final String _classid;

  Class(this._name, this._id, this._classid);

  String get classid => _classid;

  set classid(String value) {
    _classid = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}