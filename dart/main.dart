import 'dart:io';
import 'dart:math';

void main() {
  //premier affichage dart
  print("etude en dart! :)");

// 3 façons de déclarer une variable

// 1. var

// variable declarée et initialisée
// var utilise "l'inférence" de type.  et n'exige pas une initialisation immédiate.
  var name;
  var myName = 'Fred';

// 2. Object

// Object represente n'importe quel type.
// n'exige pas d'être initialisé tout de suite.
  Object prenom = 'bob';
  Object monPrenom = 'JC';

// 3. typer object

// déclaration typée :
  String machaine = 'ma chaine';
  String monAutreChaine;
// machaine = 5; (X)
// machaine = '5'; (O)

// une variable non initialisée a impliciement le type NULL.
  print(name); // null (type par default)
// une variable declarée sans inférence et non initialisée doir OBELIGATOIREMENT étre initialisée avant d'être utilisée.

// le code ci dessous génère une erreur:
// print(monAutreChaine); // The non-nullable local variable 'monAutreChaine' must be assigned before it can be used.

// Les modificateurs

// late = je vais initialiser plus tard. variable lazy. c'est une variable qui n'est pas initialisé tout de suite.

  late String maVariableLazy;

//...

  maVariableLazy = 'une var lazy';

  print(maVariableLazy);

// Final
// final c'est une constante qu'on est pas obligé d'initialiser tout de suite.

  final nom = 'Léo <3 **';
  final String pseudo;

// ...
  pseudo = 'a1';
// pseudo = 'bob'; (X) constant peut être infecté qu'une fois.

// const

// constant doit être initialisé tout de suite. seulement une fois.
  const atm = 100000;
// const atm; (X)

// var on peut changer la valeur
// const exprime egalement une constance en nature, ci dessous la var tableau est un TABLEAU et ne peut être assignée à autre chose qu'un tableau.

  var tableau = const [];
  tableau = [1, 2, 3];
  // tableau = '123' (X)

  final tab =
      const []; // final c'est une constant. on a assigné un tableau vide. des lora sa valeur ne peux plus changer.
  // tab = [1, 2, 3]; (X)

  // Les opérateurs
  // Les opérateurs arithemetiques.

  // incrément après
  int a = 5;
  int b = a++;
  print(b); //5
  print(a); //6

  print('-------------------');
  // incrément avant
  a = 5;
  b = ++a;
  print(a); //6
  print(b); //6

// Les operateurs d'égalité
// il y en a qu'un : == qui vérifie type + valeur
// !=

// Opérateur de test de type
// as : permet de transtyper
// is : permet de vérifier l'égalité entre deux types
// is! : permet de vérifier l'inégalité entre deux types.

  int c = 10;
  print(c is int); //true
  print(c is! int); // false
  print(c is! Null); //true

// Opérateurs logique
// !
// &&
// ||
// ternaire ?
// optionnel ?

  String playerName([String? name]) => name ?? 'Guest';

  print(playerName());
  print(playerName('Bob')); // Guest, parce que name est null.
  // print(playerName('bob'));
// je peux écrire cette function avec name ou sans
// ?? : évaluer à gauche. si name est null, il prend guest, sinon il reste name.
// si name est null, prends guest

  String PlayerName2([String? name]) {
    if (name != Null) {
      return name as String;
    } else {
      return 'Guest';
    }
  }

  // Les types natifs
  // Numbers (int, double)
  // String
  // Booleans
  // Lists
  // Sets (tableau sans répetition. chaques elements sont uniques)
  // Maps (c'est un type)
  // Symbols
  // Null

  // Object
  // Enum
  // Future
  // Stream
  // Iterable
  // Never
  // dynammic (Object any)(< Object)
  // void

  // méthodes liées au type :
  // transtypage de string -> number
  print(double.parse('1') is double); // 1.0, true
  // parse int = chaine en integer.
  print(int.parse('1') is int); //1 (c'est un integer.), true

// int -> string
  print(1.toString() is String); // 1 (string), true

  // double -> stirng
  print(3.14158.toStringAsFixed(2)); //3.14

  // Les méthodes liées aux String
  // interpollation
  String maString = 'l\'interpollation d\'';
  print(
      'Ceci est $maString une chaine Dart'); // Ceci est l'interpollation d' une chaine Dart

  // uppercase :
  print(
      'Ceci est ${maString.toUpperCase()} une chaine Dart'); // Ceci est L'INTERPOLLATION D' une chaine Dart

  // concatenation
  String concat = 'la concatenation'
      "fonctionne meme avec les"
      'retours à la ligne';

  print(concat); // la concatenationfonctionne meme avec lesretours à la ligne

  String s1 = ''' On peut maintenant 
écrire où on veut ''';

  print(s1);
  // On peut maintenant
  // écrire où on veut

  // Les structure de données
  // Les listes
  // ce sont les tableaux que vous connaissez

  var list = [
    1,
    2,
    3,
  ]; //il est recommandé de mettre , à la fin (sauf JSON).
  // ! pas de '' dans JSON, toujours "" !

  var list2 = [
    1,
    2,
    3,
  ];
  list2 = [
    3,
    4,
    5,
  ];

  // spread operator
  var list3 = [0, ...list2];

  // collection IF
  var p = true;
  var nav = [
    'Home',
    if (p) 'Kitchen'
  ]; //condition sur initialisation de la variable

  // collection FOR
  var listOfInts = [
    1,
    2,
    3,
  ];
  var listOfStirng = ['#0', for (var i in listOfInts) '#$i'];

  // les sets $
  // collections non ordonnée d'éléments "uniques"
  var halogene = {
    'fluorine',
    'chlorine',
    'bromine',
    'astatine'
  }; //Set<String> halogene {!}
  print(halogene); //[fluorine, chlorine, bromine, astatine]

// set vide.
  var monSetVide = <String>{};

// ajout d'élément dans un set
  var elements = <String>{};
  elements.add('fluorine');
  print(elements); //{fluorine}
  elements.addAll(halogene);
  print(
      elements); //{fluorine, chlorine, bromine, astatine} (le même élement (fluorine) s'ajoute pas)

  // Longueur du set
  print(elements.length); //4
  print(elements.length.toString()); //4

  // Les maps
  // Structure de données qui contient des paires clef-valeur.
  // clé : index unique.

  var gifts = {
    'clef1': 'valeur1',
    'clef2': 'valeur2',
    // ...
  };

  print(gifts); // {clef1: valeur1, clef2: valeur2}

  var MaFausseList = {
    0: 'ma chaine1',
    1: 'ma chaine2',
    2: 'ma chaine3',
  };

  print(MaFausseList); // type : Map<int, String> MaFausseList
  // print 2ieme élément
  print(MaFausseList.length); // 3
  print(MaFausseList[1]); // ma chaine2
  print(gifts['clef1']); // valeur1

  // map vide (difference avec set c'est que map a plusieurs type forcemment car c'est clé valeur. Set il y qu'un type.)
  var mapVide = <String, String>{};

  // ajouter une valeur dans une map
  mapVide['clef1'] = 'Valeur1';
  print(mapVide); // {clef1: Valeur1}

  // ----------------------------------
  // exercice : créer une liste de chaines nommée mesPrénoms vide.
  // ajouter les prénoms suivants : 'Seth', 'Kathy', 'Lars'
  var mesPrenoms = <String>[];
  mesPrenoms.add('Seth');
  mesPrenoms.add('Kathy');
  mesPrenoms.add('Lars');
  print(mesPrenoms); //[Seth, Kathy, Lars]
  // ou
  // mesPrenoms.addAll(['Seth', 'Kathy', 'Lars']);

  // Créer un set de chaine vide nommé SetPrenom
  // rajouter tous les prénoms de laliste mesPrenoms
  // en une seule instruction.
  var SetPrenom = <String>{};
  SetPrenom = Set<String>.from(mesPrenoms);
  // SetPrenom.addAll(mesPrenoms);
  print('le set est ${SetPrenom}'); //[Seth, Kathy, Lars]

  // Les functions
  // il faut : un mot cléf, nom, des parametres, un corps, un type de retour.
  bool isNoble(int nbrAtomique) {
    return nbrAtomique > 5;
  }

  print(isNoble(5)); // false

// une function peut prendre une autre function en parametre du moment que son type de retour concorde.
  int maFunction() {
    return 4;
  }

  print(isNoble(maFunction()));

// Particularités des paramètres.
// Obligatoire
// possède une valeur par default est optionnel

  void uneFunction(String param1, {bool param2 = false, String? param3}) {}

// autre façin d'écrire une function en Dart
  var mettreEnMaj = (String message) => message.toUpperCase();
  mettreEnMaj('hello');

// function anonymes (simple)
  const fruits = ['pomme', 'banane', 'orange'];
  var message = fruits.map((item) => item.toUpperCase());

// complex
  fruits.map((item) {
    return item.toUpperCase();
  });

  print(message); // (POMME, BANANE, ORANGE)
  // bloc try catch

  try {
    // instructions..
  } on HttpException catch (e) {
    // intructions..
  } on Exception catch (e) {
    // instructions..
  }

  // classe et objet:
  var point = Point.autre(2, 2);
  
  var maSmartTele = SmartTelevision();
  
  maSmartTele.allumeTelevision();
}

// classes et objets
class Point {
  double? _x; // x peut être initialement null
  double? _y; // y peut être initialement null
  double _z = 0;

  // constructeur
  // unn classe peut avoir plusieurs contructeurs
  Point(double x, double y, {double? z}) {
    this._x = x;
    this._y = y;
    this._z = z ?? 0;
  }
  // autre constructeur
  Point.autre(double x, double y) {
    this._x = x;
    this._y = y;
  }

  // méthode
  double distanceTo(Point autrePoint) {
    double dx = this._x! - autrePoint._x!;
    double dy = this._y! - autrePoint._y!;

    return sqrt(dx * dx + dy * dy);
  }

  // getter setter
  double get x => this._x!;

  set x(double newValue) => this._x = newValue;
}

// heritage
class Television {
  void allumeTelevision() {
    this._illumineEcran();
    this._activeLesCapteursIR();
    print('Ecran allumé');
  }

  void _illumineEcran() {
    print('Ecran illuminé');
  }

  void _activeLesCapteursIR() {
    print('Capteurs IR actifs');
  }
}

class SmartTelevision extends Television {
  void allumeTelevision() {
    this._bootNetwork();
    this._initialiseMemoire();
    this._upgradeApp();
    this._illumineEcran();
    this._activeLesCapteursIR();
  }

  _bootNetwork() {
    print('Reseau Booté');
  }

  _initialiseMemoire() {
    print('Mémoire initialisée');
  }

  _upgradeApp() {
    print('App Mise à jour');
  }
}