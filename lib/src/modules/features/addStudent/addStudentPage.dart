import 'package:flutter/material.dart';

class AddStudentPage extends StatelessWidget {
  const AddStudentPage({super.key});

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
                onPressed: () {},
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
