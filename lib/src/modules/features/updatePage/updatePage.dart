import 'package:flutter/material.dart';

import '../componets/cardBodyWidget.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDelete=true;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chỉnh sửa'),
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