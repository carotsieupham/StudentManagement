class Students{
   late final String _id;
   late final String _name;
   late final String _classname;
   Students(this._id, this._name,this._classname);

   String get classname => _classname;

  String get name => _name;

  String get id => _id;

   set classname(String value) {
    _classname = value;
  }

  set name(String value) {
    _name = value;
  }

  set id(String value) {
    _id = value;
  }
}