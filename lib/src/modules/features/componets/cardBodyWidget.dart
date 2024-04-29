import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../updatePage/components/cardModalButton.dart';
import '../../../firebase/firebase_firestore.dart';
class CardBodyWidget extends StatelessWidget {
  final bool isDelete;
  final bool isEdit;
  final students;

  CardBodyWidget({
    Key? key,
    required this.students,
    required this.isDelete,
    required this.isEdit,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FireStore.getClassName(students.id),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox.shrink();
        } else {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
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
                        Text(
                          students.mssv,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Color(0xff4B4B4B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          students.name,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Color(0xff4B4B4B),
                          ),
                        ),
                        Text(
                          snapshot.data!,
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
                          FireStore.deleteStudent(students);
                        },
                        child: const Icon(Icons.delete, color: Colors.red, size: 35),
                      ),
                    if (isEdit)
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return CardModalButton(students: students,classes:snapshot.data! ,);
                            },
                          );
                        },
                        child: const FaIcon(
                          FontAwesomeIcons.userPen,
                          color: Color(0xff4B4B4B),
                          size: 30,
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
        }
      },
    );
  }
}



