import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../updatePage/components/cardModalButton.dart';

class CardBodyWidget extends StatelessWidget {
  final bool isDelete;
  final bool isEdit;
  var students;
   CardBodyWidget({
    Key? key,
     required this.students,
    required this.isDelete,
    required this.isEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xffDFDFDF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 22,
                      color: Color(0xff4B4B4B),
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(text: students.id),
                      TextSpan(text: " - "),
                      TextSpan(text: students.name),
                    ],
                  ),
                ),
                Text(
                  students.classname,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xff4B4B4B),
                  ),
                ),
              ],
            ),
            if (isDelete)
              InkWell(
                onTap: () {
                  print('hello');
                },
                child: Icon(Icons.delete, color: Colors.red, size: 35),
              ),
            if (isEdit)
              InkWell(
                onTap: () {
                  showModalBottomSheet(context: context,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top:Radius.circular(20))
                      ),
                      isScrollControlled: true,
                      builder: (BuildContext context){
                          return CardModalButton();
                  });
                },
                child: FaIcon(
                  FontAwesomeIcons.userPen,
                  color: Color(0xff4B4B4B),
                  size: 35,
                ),
              ),
          ],
        ),
      ),
    );
  }
}



