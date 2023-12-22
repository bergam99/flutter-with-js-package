import 'package:flutter/material.dart';
import 'package:flutter_http/models/student.model.dart';
import 'package:flutter_http/services/student.service.dart';

class StudentsLister extends StatefulWidget {
  const StudentsLister({super.key});

  @override
  State<StudentsLister> createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsLister> {
  late Future<StudentList?> students;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() {
    setState(() {
      students = StudentService.getStudents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<StudentList?>(
        future: students,
        builder: (context, snapshot) {
          // Les données sont arrivées sans erreurs
          if (snapshot.hasData) {
            // return Container();
            List<Student> students = snapshot.data!.students;
            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                Student student = students[index];

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
                              "Matières étudiées: ${student.matieres.join(',')}"),
                          Text(
                              "Moyenne générale ( /20): ${student.getAverage()}"),
                        ],
                      ),
                      // You can handle onTap here
                      onTap: () {
                        // Add your onTap logic
                      },
                    ),
                  ),
                );
              },
            );
            // La requete a provoqué une erreur
          } else if (snapshot.hasError) {
            return Text("error: ${snapshot.error}");
          }

          // pas encore de données, et pas d'erreur,
          // on retourne un spinner
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
