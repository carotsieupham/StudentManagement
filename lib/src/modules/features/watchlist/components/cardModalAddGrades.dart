import 'package:flutter/material.dart';
import 'package:student_manage/src/firebase/firebase_firestore.dart';
import 'package:student_manage/src/model/students.dart';

class CardModalAddGrades extends StatefulWidget {
  CardModalAddGrades({super.key,required this.students,required this.refreshData}) ;
  Students students;
  final Function refreshData;
  late final TextEditingController _nameSubjectController= TextEditingController();
  late final TextEditingController _gradesController= TextEditingController();
  Map<String,String> subjecID={
    "Toán rời rạc":"S01",
    "Cấu trúc dữ liệu và giải thuật":"S02",
  };
  @override
  State<CardModalAddGrades> createState() => _CardModalAddGradesState();
}

class _CardModalAddGradesState extends State<CardModalAddGrades> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: widget._nameSubjectController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tên môn học',
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: widget._gradesController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Điểm',
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  FireStore.addGrades(widget.students.mssv, widget._gradesController.text, widget.subjecID[widget._nameSubjectController.text]!)
                      .then((_) {
                    Navigator.of(context).pop();
                    // Sau khi thêm điểm thành công, gọi hàm refreshData từ widget để cập nhật dữ liệu
                    widget.refreshData();
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('Thêm điểm',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
