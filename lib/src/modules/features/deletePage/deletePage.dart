import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../componets/list_student.dart';

class DeletePage extends StatelessWidget {
  const DeletePage({super.key});

  @override
  Widget build(BuildContext context) {
    late final Stream<QuerySnapshot> _stream=
    FirebaseFirestore.instance.collection('student').snapshots();
    bool isDelete=true;
    bool isEdit=false;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Xóa sinh viên'),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(31),
            child:ListStudents(stream: _stream, isDelete: isDelete, isEdit: isEdit)
        )
    );
  }
}
