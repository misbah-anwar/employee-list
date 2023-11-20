import 'package:employee_list/student.dart';
import 'package:flutter/material.dart';

class Employee extends StatelessWidget {
  const Employee({
    required this.employees,
    required this.students,
    required this.mentors,
    super.key,
  });
  final Map<String, dynamic> employees;
  final Map<String, dynamic> students;
  final Map<String, dynamic> mentors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 172, 162, 189),
        foregroundColor: Colors.black,
        title: const Text('Employee Details'),
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
                employees.length,
                (index) {
                  String key = employees.keys.elementAt(index);
                  return DataRow(
                    cells: [
                      DataCell(
                        Text(employees[key]['name']),
                      ),
                      DataCell(
                        Text(employees[key]['location']),
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
              builder: (context) => Student(
                students: students,
                employees: employees,
                mentors: mentors,
              ),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward,
            color: Color.fromARGB(182, 0, 0, 0)),
      ),
    );
  }
}
