import 'package:flutter/material.dart';

import '../componets/cardBodyWidget.dart';

class DeletePage extends StatelessWidget {
  const DeletePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDelete=true;
    bool isEdit=false;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Xóa sinh viên'),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(31),
            child:Column(
              children: [
                // CardBodyWidget(isDelete: isDelete,isEdit: isEdit,),
                // CardBodyWidget(isDelete: isDelete,isEdit: isEdit,),
                // CardBodyWidget(isDelete: isDelete,isEdit: isEdit,),
              ],
            )
        )
    );
  }
}
