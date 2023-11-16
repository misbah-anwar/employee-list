import 'package:flutter/material.dart';

class Employee extends StatelessWidget {
  const Employee({required this.employees, super.key});
  final Map<String, dynamic> employees;

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
    );
  }
}
