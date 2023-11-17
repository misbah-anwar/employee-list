import 'package:employee_list/employee.dart';
import 'package:flutter/material.dart';

class Student extends StatelessWidget {
  const Student({required this.employees, required this.students, super.key});
  final Map<String, dynamic> students;
  final Map<String, dynamic> employees;

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Employee(employees: employees, students: students)),
          );
        },
        child: const Icon(Icons.arrow_forward,
            color: Color.fromARGB(182, 0, 0, 0)),
      ),
    );
  }
}
