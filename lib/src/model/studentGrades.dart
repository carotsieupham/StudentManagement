class StudentGrades{
  late String _studentId;
  late String _subjectId;
  late double _grade;

  StudentGrades(this._studentId, this._subjectId, this._grade);

  double get grade => _grade;

  set grade(double value) {
    _grade = value;
  }

  String get subjectId => _subjectId;

  set subjectId(String value) {
    _subjectId = value;
  }

  String get studentId => _studentId;

  set studentId(String value) {
    _studentId = value;
  }
}