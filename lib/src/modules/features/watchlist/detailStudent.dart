import 'package:flutter/material.dart';

class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trần Minh Trí'),
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
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('1')),
              DataCell(Text('John')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('2')),
              DataCell(Text('Jane')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('3')),
              DataCell(Text('Doe')),
            ],
          ),
        ],
      ),
    );
  }
}