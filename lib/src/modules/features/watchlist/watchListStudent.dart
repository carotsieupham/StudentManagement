import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_manage/src/model/students.dart';
import '../componets/cardBodyWidget.dart';


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
           child:StreamBuilder(
             stream: _stream ,
             builder: (context, snapshot) {
               if(!snapshot.hasData){
                 return const Center(child:CircularProgressIndicator()) ;
               }
               return ListView.builder(
                   shrinkWrap: true,
                   itemCount: snapshot.data!.docs.length,
                   itemBuilder: (context,index){
                     Students students=Students(
                         snapshot.data!.docs[index]['id'],
                         snapshot.data!.docs[index]['name'],
                         snapshot.data!.docs[index]['classname']
                     );
                 return CardBodyWidget(
                    students: students,
                   isDelete: isDelete,
                   isEdit: isEdit,
                 );
               });
             }
           )
      )
    );
  }
}
