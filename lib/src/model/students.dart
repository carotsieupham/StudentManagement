class Students{
   late final String _id;
   late final String _name;
   late final String _classid;
   Students(this._id, this._name,this._classid);

   String get classid => _classid;

  String get name => _name;

  String get id => _id;

   set classid(String value) {
    _classid = value;
  }

  set name(String value) {
    _name = value;
  }

  set id(String value) {
    _id = value;
  }
}