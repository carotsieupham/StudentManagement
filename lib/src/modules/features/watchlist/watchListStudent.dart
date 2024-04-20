import 'package:flutter/material.dart';

import '../componets/cardBodyWidget.dart';


class WatchStudentPage extends StatelessWidget {
  const WatchStudentPage({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDelete=false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách sinh viên'),
      ),
      body: SingleChildScrollView(
           padding: const EdgeInsets.all(31),
           child:Column(
             children: [
               CardBodyWidget(isDelete: isDelete,),
               CardBodyWidget(isDelete: isDelete,),
               CardBodyWidget(isDelete: isDelete,),
             ],
           )
      )
    );
  }
}
