import 'package:flutter/material.dart';

class Mentor extends StatelessWidget {
  final Map<String, dynamic> employees;
  final Map<String, dynamic> students;

  const Mentor({Key? key, required this.employees, required this.students})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DataRow> mentorRows = [];

    for (int i = 0; i < employees.length; i++) {
      String employeeKey = employees.keys.elementAt(i);
      String mentorName = employees[employeeKey]['name'];

      String menteeName = "No Mentee";

      if (i < students.length) {
        String studentKey = students.keys.elementAt(i);
        menteeName = students[studentKey]['name'];
      }

      mentorRows.add(
        DataRow(
          cells: [
            DataCell(
              Text(mentorName),
            ),
            DataCell(
              Text(menteeName),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 172, 162, 189),
        foregroundColor: Colors.black,
        title: const Text('Mentor Details'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 190, 171, 223),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: DataTable(
              columns: const [
                DataColumn(
                  label: Text('Employee Name'),
                ),
                DataColumn(
                  label: Text('Student Name'),
                ),
              ],
              rows: mentorRows,
            ),
          ),
        ),
      ),
    );
  }
}
