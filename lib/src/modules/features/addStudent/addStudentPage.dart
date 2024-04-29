import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../firebase/firebase_firestore.dart';

class AddStudentPage extends StatefulWidget {
  AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController classController = TextEditingController();

  final TextEditingController mssvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map<String, String> classid = {
      'CN22CLCF': 'C01',
      'CN22CLCA': 'C02',
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm sinh viên'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(31),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Họ và tên',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: classController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Lớp',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: mssvController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mssv',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  String name = nameController.text.trim();
                  String classname = classController.text.trim();
                  String mssv = mssvController.text.trim();
                  // Kiểm tra nếu có bất kỳ trường nào trống
                  if (name.isEmpty || classname.isEmpty || mssv.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Vui lòng điền đầy đủ thông tin'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    try {
                      FireStore.addStudent(name, classid[classname]!, mssv);
                      // Xóa nội dung của các TextField sau khi thêm sinh viên
                      nameController.clear();
                      classController.clear();
                      mssvController.clear();
                      // Hiển thị snackbar thông báo thành công
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Thêm sinh viên thành công'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } catch (e) {
                      // Xử lý nếu có lỗi xảy ra
                      print('Error: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Đã xảy ra lỗi, vui lòng thử lại sau'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('Thêm sinh viên'),
              ),
            )

          ],
        ),
      ),
    );
  }
}
