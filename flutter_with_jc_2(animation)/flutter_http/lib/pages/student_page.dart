import 'package:flutter/material.dart';
import 'package:flutter_http/components/studentLister.dart';
import 'package:flutter_http/components/studentsLister.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({super.key, required this.all}); //all

  final bool all; //all

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(all ? "Nos étudiants" : "un étudiant"),
        ),
        body: Flexible(
          child: all ? const StudentsLister() : const StudentLister(), //all
        ));
  }
}
