import 'package:employee_list/employee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'api.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  Map<String, dynamic> employees = {};
  Map<String, dynamic> students = {};

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    var employeeData = await Api.fetchEmployees();
    var studentData = await Api.fetchStudents();

    setState(() {
      employees = employeeData;
      students = studentData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Employee(
      employees: employees,
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
