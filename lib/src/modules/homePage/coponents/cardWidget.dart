import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    super.key,
    required this.icon,
    required this.onTap,
    required this.content,
    required this.size,
  });
  IconData icon;
  final VoidCallback onTap;
  String content;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Container(
              width:size.width*0.4,
              height: size.height*0.2,
              color: const Color(0xff45a8ad),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(icon, size: 50, color: Colors.white,),
                  Text(content,
                    style: const TextStyle(color: Colors.white, fontSize: 20,),
                    textAlign: TextAlign.center,

                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}