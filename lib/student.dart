import 'package:flutter/material.dart';

class Student extends StatelessWidget {
  const Student({required this.students, super.key});
  final Map<String, dynamic> students;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 172, 162, 189),
        foregroundColor: Colors.black,
        title: const Text('Student Details'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 190, 171, 223),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: DataTable(
              //border: TableBorder.all(),
              columns: const [
                DataColumn(
                  label: Text('Name'),
                ),
                DataColumn(
                  label: Text('Location'),
                ),
              ],
              rows: List<DataRow>.generate(
                students.length,
                (index) {
                  String key = students.keys.elementAt(index);
                  return DataRow(
                    cells: [
                      DataCell(
                        Text(students[key]['name']),
                      ),
                      DataCell(
                        Text(students[key]['location']),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
