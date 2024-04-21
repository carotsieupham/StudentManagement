import 'package:flutter/material.dart';

class CardModalButton extends StatelessWidget {
  const CardModalButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child:Column(
                children:[
                  TextField(
                    onChanged:(value){

                    },
                    decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tên sinh viên'
                    ) ,
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    onChanged:(value){

                    },
                    decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Lớp'
                    ) ,
                  ),
                  const SizedBox(height: 20,),TextField(
                    onChanged:(value){

                    },
                    decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mssv'
                    ) ,
                  ),
                  const SizedBox(height: 20,),

                  SizedBox(
                      width:double.infinity,
                      height:50 ,
                      child:ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(backgroundColor:Colors.blue),
                          child:const Text('Chỉnh sửa')
                      )

                  )
                ]
            )
        ));
  }
}