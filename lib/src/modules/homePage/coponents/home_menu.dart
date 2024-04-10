import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => HomeMenuState();
}

class HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
            child: const Row(
              children: [
                Icon(Icons.home,color:Color(0xff323643) ,),
                SizedBox(width: 10,),
                Text('Home',style: TextStyle(fontSize: 18, color: Color(0xff323643))),
              ],
            )),
        ListTile(
          title: Text(
            "Ride History",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
        ListTile(
          title: Text(
            "Offers",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
      ],
    );
  }
}
