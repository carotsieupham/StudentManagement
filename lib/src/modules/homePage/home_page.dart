import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_manage/src/modules/homePage/coponents/home_menu.dart';

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
                  CardWidget(size: size),
                  CardWidget(size: size),

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

class CardWidget extends StatelessWidget {
  CardWidget({
    required this.icon,
    required this.onTap,
    required this.content,
    super.key,
    required this.size,
  });
  Icon icon;
  Function onTap;
  String content;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Container(
            width:size.width*0.4,
            height: size.height*0.2,
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 50, color: Colors.white,),
                Text(content, style: TextStyle(color: Colors.white, fontSize: 20)),
              ],
            )
          ),
        ),
      ),
    );
  }
}
