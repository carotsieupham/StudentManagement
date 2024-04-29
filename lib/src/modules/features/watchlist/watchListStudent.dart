import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../componets/list_student.dart';


class WatchStudentPage extends StatefulWidget {
  WatchStudentPage({super.key});

  @override
  State<WatchStudentPage> createState() => _WatchStudentPageState();
}

class _WatchStudentPageState extends State<WatchStudentPage> {
  late final Stream<QuerySnapshot> _stream=
    FirebaseFirestore.instance.collection('student').snapshots();

  @override
  Widget build(BuildContext context) {
    bool isDelete=false;
    bool isEdit=false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách sinh viên'),
      ),
      body: SingleChildScrollView(
           padding: const EdgeInsets.all(31),
            child: ListStudents(stream: _stream, isDelete: isDelete, isEdit: isEdit)
      )
    );
  }
}
