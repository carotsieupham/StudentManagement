import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddStudentPage extends StatelessWidget {
  AddStudentPage({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              onChanged: (value) {
                // text=value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Họ và tên',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: classController,
              onChanged: (value) {
                // text=value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Lớp',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: idController,
              onChanged: (value) {
                // text=value;
              },
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
                  String className = classController.text.trim();
                  String id = idController.text.trim();

                  // Kiểm tra nếu có bất kỳ trường nào trống
                  if (name.isEmpty || className.isEmpty || id.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Vui lòng điền đầy đủ thông tin'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    // Nếu thông tin đầy đủ, tiến hành thêm sinh viên
                    FirebaseFirestore firestore = FirebaseFirestore.instance;
                    try {
                      await firestore.collection('student').add({
                        'name': name,
                        'classname': className,
                        'id': id
                      });
                      // Xóa nội dung của các TextField sau khi thêm sinh viên
                      nameController.clear();
                      classController.clear();
                      idController.clear();
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
