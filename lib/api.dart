import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static Future<Map<String, dynamic>> fetchEmployees() async {
    final url = Uri.https(
        'flutter-prep-851bd-default-rtdb.firebaseio.com', 'employee-list.json');
    var response = await http.get(url);
    var employees = jsonDecode(response.body);
    print(employees);

    return employees;
  }

  static Future<Map<String, dynamic>> fetchStudents() async {
    final url = Uri.https('flutter-prep-851bd-default-rtdb.firebaseio.com',
        'vit-student-list.json');
    var response = await http.get(url);
    var students = jsonDecode(response.body);
    print(students);

    return students;
  }
}
