import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../model/students.dart';
import '../watchlist/detailStudent.dart';
import 'cardBodyWidget.dart';

class ListStudents extends StatelessWidget {
  const ListStudents({
    super.key,
    required Stream<QuerySnapshot<Object?>> stream,
    required this.isDelete,
    required this.isEdit,
  }) : _stream = stream;

  final Stream<QuerySnapshot<Object?>> _stream;
  final bool isDelete;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
                    snapshot.data!.docs[index].id,
                    snapshot.data!.docs[index]['mssv'],
                    snapshot.data!.docs[index]['name'],
                    snapshot.data!.docs[index]['classid']
                );
                return GestureDetector(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyTable()));
                  } ,
                  child: CardBodyWidget(
                    students: students,
                    isDelete: isDelete,
                    isEdit: isEdit,
                  ),
                );
              });
        }
    );
  }
}