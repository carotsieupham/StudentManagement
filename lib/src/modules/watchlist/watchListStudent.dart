import 'package:flutter/material.dart';
import 'package:student_manage/src/modules/watchlist/componets/cardBodyWidget.dart';

class WatchStudentPage extends StatelessWidget {
  const WatchStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách sinh viên'),
      ),
      body: SingleChildScrollView(
           padding: const EdgeInsets.all(31),
           child:Column(
             children: [
               CardBodyWidget(),
               CardBodyWidget(),
               CardBodyWidget(),
             ],
           )
      )
    );
  }
}
