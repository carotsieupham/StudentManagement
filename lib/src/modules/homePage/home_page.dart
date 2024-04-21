import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_manage/src/modules/features/addStudent/addStudentPage.dart';
import 'package:student_manage/src/modules/features/updatePage/updatePage.dart';
import 'package:student_manage/src/modules/homePage/coponents/home_menu.dart';
import 'package:student_manage/src/modules/features/watchlist/watchListStudent.dart';

import '../features/deletePage/deletePage.dart';
import 'coponents/cardWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quản lý sinh viên'),
        ),
        body: Column(
          children: [
            RichText(text: const TextSpan(
              children: [
                TextSpan(text: 'Sinh viên\n', style: TextStyle(color: Colors.black, fontSize: 60,fontWeight: FontWeight.bold)),
                TextSpan(text: 'Thông tin sinh viên', style: TextStyle(color: Colors.black, fontSize: 40)),
              ]
            )
            ),
            const SizedBox(height: 20,),
            GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
                children:[
                  CardWidget(icon: FontAwesomeIcons.eye,onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => WatchStudentPage()));},content: "Xem danh sách",size: size),
                  CardWidget(icon: FontAwesomeIcons.penToSquare,onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePage()));},content: "Chỉnh sửa danh sách",size: size),
                  CardWidget(icon: FontAwesomeIcons.trash,onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DeletePage()));},content: "Xóa sinh viên",size: size),
                  CardWidget(icon: FontAwesomeIcons.plus,onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AddStudentPage()));},content: "Thêm sinh viên",size: size),

                ],
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(
            )
            )



          ],
        ),
        drawer: Drawer(
          child: HomeMenu(),
        ));
  }

}


