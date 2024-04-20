import 'package:flutter/material.dart';

class CardBodyWidget extends StatelessWidget {
  CardBodyWidget({Key? key,required this.isDelete}) : super(key: key);
  bool isDelete;
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
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 RichText(text: TextSpan(
                   children: [
                     TextSpan(
                       text: "2251150039",
                       style: const TextStyle(
                         fontSize: 22,
                         color: Color(0xff4B4B4B),
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     TextSpan(
                       text: " - ",
                       style: const TextStyle(
                         fontSize: 22,
                         color: Color(0xff4B4B4B),
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     TextSpan(
                       text: "Trần Minh Trí",
                       style: const TextStyle(
                         fontSize: 22,
                         color: Color(0xff4B4B4B),
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ]
                 )),
                  Text(
                    "CN22CLCF",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xff4B4B4B),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: isDelete,
              child: InkWell(
                onTap: () {

                },
                child: Icon(Icons.delete,color: Colors.red,size:35),
              ),
            )
          ],
        ),
      ),
    );
  }
}
