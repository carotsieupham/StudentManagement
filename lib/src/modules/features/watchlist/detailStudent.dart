import 'package:flutter/material.dart';
import '../../../firebase/firebase_firestore.dart';

class DetailStudentPage extends StatefulWidget {
   DetailStudentPage({super.key,required this.students}) ;
  var students;
  @override
  State<DetailStudentPage> createState() => _DetailStudentPageState();
}

class _DetailStudentPageState extends State<DetailStudentPage> {
  late List<Map<String, dynamic>> _data;

  @override
  void initState() {
    super.initState();
    _data = [];
    _fetchData();
  }

  Future<void> _fetchData() async {
    List<Map<String, dynamic>> newData = [];
    await FireStore.getGrades(newData);
    setState(() {
      _data = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.students.name),
      ),
      body: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Môn học',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Điểm',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
        rows: _data.where((data) => data['mssv'] == widget.students.mssv).map((data) {
          return DataRow(
            cells: [
              DataCell(
                FutureBuilder<String>(
                  future: FireStore.getSubjectName(data['subjectId']),
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox.shrink(); // Hiển thị tiến trình chờ đợi
                    } else {
                      if (snapshot.hasError) {
                        return Text('Error'); // Hiển thị thông báo lỗi nếu có lỗi xảy ra
                      } else {
                        return Text(snapshot.data ?? ''); // Hiển thị dữ liệu khi truy vấn hoàn thành
                      }
                    }
                  },
                ),
              ),
              DataCell(Text(data['grades'].toString())), // Chuyển đổi thành chuỗi trước khi sử dụng
            ],
          );
        }).toList(),
      ),
    );
  }
}

