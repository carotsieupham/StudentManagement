import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_manage/src/firebase/firebase_firestore.dart';

class CardModalButton extends StatefulWidget {
  CardModalButton({
    super.key,required this.students, required this.classes
  });
  var students;
  String classes;
  @override
  State<CardModalButton> createState() => _CardModalButtonState();
}

class _CardModalButtonState extends State<CardModalButton> {
  late TextEditingController _nameController;
  late TextEditingController _classController;
  late TextEditingController _mssvController;
  Map<String, String> classid = {
    'CN22CLCF': 'C01',
    'CN22CLCA': 'C02',
  };

  @override
  void initState() {

    super.initState();
    _nameController=TextEditingController(text:widget.students.name);
    _classController=TextEditingController(text:widget.classes);
    _mssvController=TextEditingController(text:widget.students.mssv);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child:Column(
                children:[
                  TextField(
                    controller: _nameController,
                    decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tên sinh viên'
                    ) ,
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: _classController,
                    decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Lớp'
                    ) ,
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: _mssvController,
                    decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mssv'
                    ) ,
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                      width:double.infinity,
                      height:50 ,
                      child:ElevatedButton(
                          onPressed: (){
                            FireStore.updateStudent(widget.students.id,
                                _nameController.text,
                                classid[_classController.text]!,
                                _mssvController.text);
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(backgroundColor:Colors.blue),
                          child:const Text('Chỉnh sửa')
                      )

                  )
                ]
            )
        ));
  }
}