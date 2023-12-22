import 'dart:convert';

import 'package:flutter_http/models/student.model.dart';
import 'package:http/http.dart' as http;

class StudentService {
  // pour chrome
  static String studentUrl = "http://localhost:8000/student.json";

  // pour emulateur
  //static String productUrl = "http://10.0.2.2:8000/products.json";

  static Future<Student?> getStudent() async {
    try {
      final response = await http
          .get(Uri.parse(studentUrl), headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        // succès de l'api call
        if (response.body.isNotEmpty) {
          final jsonResponse = json.decode(response.body);
          final Student student = Student.fromJson(jsonResponse);
          return student;
        } else {
          return null;
        }
      } else {
        throw Exception('Impossible de charger les student1');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Impossible de charger les student2');
    }
  }

// ================== STUDENTLIST =====================
  // pour chrome
  static String studentsUrl = "http://localhost:8000/students.json";

  // pour emulateur
  //static String productUrl = "http://10.0.2.2:8000/products.json";

  static Future<StudentList?> getStudents() async {
    try {
      final response = await http
          .get(Uri.parse(studentsUrl), headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        // succès de l'api call
        if (response.body.isNotEmpty) {
          final jsonResponse = json.decode(response.body);
          final StudentList students = StudentList.fromJson(jsonResponse);
          if (students.students.isNotEmpty) {
            return students;
          } else {
            return null;
          }
        } else {
          return null;
        }
      } else {
        throw Exception('Impossible de charger les student1');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Impossible de charger les student2');
    }
  }
}
