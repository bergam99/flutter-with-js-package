// json -> model -> service -> main button -> page -> component

import 'package:flutter/material.dart';
import 'package:flutter_http/models/student.model.dart';
import 'package:flutter_http/services/student.service.dart';

class StudentLister extends StatefulWidget {
  const StudentLister({super.key});

  @override
  State<StudentLister> createState() => _StudentListeState();
}

class _StudentListeState extends State<StudentLister> {
  late Future<Student?> student;

  @override
  void initState() {
    super.initState();
    loadStudent();
  }

  void loadStudent() {
    setState(() {
      student = StudentService.getStudent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: student,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Les données sont arrivées sans erreur:
            Student student = snapshot.data!;
            return ListView.builder(
                itemCount: 1, //
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      // You can customize Card properties here
                      child: ListTile(
                        title: Text("${student.nom} de ${student.prenom}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Matières étudiées : ${student.matieres.join(',')}"),
                            Text(
                                "Moyenne générale ( /20) : ${student.getAverage()}"),
                          ],
                        ),
                        // You can handle onTap here
                        onTap: () {
                          // Add your onTap logic
                        },
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            // La requette a provoqué une erreur.
            return Text("error: ${snapshot.error}");
          }
          return const Center(
            child: CircularProgressIndicator(), // spinner
          );
        });
  }
}
