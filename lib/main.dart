import 'package:employee_list/employee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      students: students,
      //mentors: mentors
    );
  }
}

void main() {
  GoogleFonts.config.allowRuntimeFetching = true;
  runApp(MaterialApp(
    theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
    debugShowCheckedModeBanner: false,
    home: const Home(),
  ));
}
