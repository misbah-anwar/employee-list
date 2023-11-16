import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  Map<String, dynamic> employees = {};

  @override
  void initState() {
    super.initState();
    fetchEmployees();
  }

  fetchEmployees() async {
    final url = Uri.https(
        'flutter-prep-851bd-default-rtdb.firebaseio.com', 'employee-list.json');
    var response = await http.get(url);
    var employees = jsonDecode(response.body);
    setState(() {
      this.employees = employees;
    });
  }

  fetchStudents() async {
    final url = Uri.https('flutter-prep-851bd-default-rtdb.firebaseio.com',
        'vit-student-list.json');
    var response = await http.get(url);
    var employees = jsonDecode(response.body);
    setState(() {
      this.employees = employees;
    });
  }

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

void main() {
  GoogleFonts.config.allowRuntimeFetching = true;
  runApp(MaterialApp(
    theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
    debugShowCheckedModeBanner: false,
    home: const EmployeeList(),
  ));
}
