class Subject{
  late String _subjectId;
  late String _subjectName;
  late int   _units;

  Subject(this._subjectId, this._subjectName, this._units);

  int get units => _units;

  set units(int value) {
    _units = value;
  }

  String get subjectName => _subjectName;

  set subjectName(String value) {
    _subjectName = value;
  }

  String get subjectId => _subjectId;

  set subjectId(String value) {
    _subjectId = value;
  }
}