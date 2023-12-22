class Student {
  // constructeur
  Student(
    this.nom,
    this.prenom,
    this.matieres,
    this.notes,
  );

  // Propriétés de la classe qui seront initialisées par
  // déclenché la méthode factory
  final String nom;
  final String prenom;
  final List<String> matieres;
  final List<double> notes;

  // Méthode factory
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      json['nom'],
      json['prenom'],
      (json["matieres"] as List).map((e) => e as String).toList(),
      (json['notes'] as List).map((e) => e as double).toList(),
    );
  }

  double? getAverage() {
    // soit double soit null
    return getNotes.isNotEmpty
        ? getNotes.reduce((value, element) => value + element) / getNotes.length
        : null;
  }

  // getters
  String get getNom => nom;
  String get getPrenom => prenom;
  List<String> get getMatieres => matieres;
  List<double> get getNotes => notes;
}

// StudentLIST
class StudentList {
  StudentList({required this.students});
// propriété requise par constructor
  final List<Student> students;

  factory StudentList.fromJson(List<dynamic> parseJson) {
    List<Student> students = <Student>[];

    students = parseJson.map((p) => Student.fromJson(p)).toList();

    return StudentList(students: students);
  }
}
