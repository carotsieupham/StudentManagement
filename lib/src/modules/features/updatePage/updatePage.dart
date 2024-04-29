import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../componets/list_student.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    late final Stream<QuerySnapshot> _stream=
    FirebaseFirestore.instance.collection('student').snapshots();
    bool isDelete=false;
    bool isEdit=true;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chỉnh sửa'),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(31),
            child:ListStudents(stream: _stream, isDelete: isDelete, isEdit: isEdit)
        )
    );
  }
}


