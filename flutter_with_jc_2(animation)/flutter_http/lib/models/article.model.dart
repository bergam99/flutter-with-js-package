// 객체생성
class Source {
  // constructor
  Source(this.id, this.name);

// 생성자, initialize
  // propriéeté initialisées par le constructor
  final int? id; //int qui peut etre null
  final String name;

  // méthode factory ( json data -> source 객체)
  // fromJson 팩토리 메서드는 주어진 JSON 데이터를 받아 해당 데이터로 Source 객체를 생성하는 역할을 합니다.
  // fromJson 메서드는 매개변수로 전달된 Map<String, dynamic> 타입의 JSON 데이터를 받습니다.
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      // fromJson 메서드가 반환할 값을 정의.
      // 생성자 호출 : json["id"]와 json["name"]은 주어진 JSON 데이터에서 각각 "id"와 "name" 키에 해당하는 값을 가져옵니다.
      // 이 값들은 Source 클래스의 생성자에 전달되어 id와 name 속성이 초기화됩니다.
      json["id"],
      json["name"],
    );
  }

  // getters
  // Getter를 사용하여 클래스의 내부 속성을 외부에서 읽을 수 있으며, 이를 통해 클래스의 상태를 안전하게 노출하고 제어할 수 있습니다. Getter는 클래스의 캡슐화를 강화하고 클래스의 상태를 안전하게 제어하는 데 유용한 도구입니다.
  int? get getId => id;
  String get getName => name;
}

class Article {
  Article(this.source, this.author, this.title, this.description);

  final Source source;
  final String author;
  final String title;
  final String description;

// Method factory
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      Source.fromJson(json[
          "source"]), // json qui contient source. // fromJson crée un object depuis json(methode des objects)
      json['author'],
      json['title'],
      json['description'],
    );
  }

// getter
  Source get getSource => source;
  String get getAuthor => author;
  String get getTitle => title;
  String get getDesciption => description;
}

class ArticleList {
  ArticleList(
      {required this.articles}); //ArticleList 클래스의 생성자는 articles라는 필수 매개변수를 받습니다. 이는 ArticleList 객체를 생성할 때 반드시 제공되어야 하는 기사 리스트입니다.

// propriété requise par constructor
//List<Article> 타입의 articles 속성은 클래스 외부에서 접근 가능하며, final 키워드로 선언되어 수정할 수 없습니다.
  final List<Article> articles;

// méthode factory
  factory ArticleList.fromJson(List<dynamic> parseJson) {
    //ArticleList 클래스의 fromJson 팩토리 메서드는 외부에서 제공된 JSON 데이터를 기반으로 ArticleList 객체를 생성합니다. parseJson은 JSON 배열을 나타내는 변수입니다. List<dynamic> 타입으로 선언되어 있습니다.

    List<Article> articles = <Article>[]; // 빈 Article 리스트를 생성합니다.

    articles = parseJson
        .map((p) => Article.fromJson(p))
        .toList(); //주어진 JSON 배열을 순회하면서 각 JSON 객체를 Article.fromJson 팩토리 메서드를 통해 Article 객체로 변환하고, 이들을 리스트에 추가합니다.

    return ArticleList(articles: articles); //최종적으로 객체를 생성하고 반환합니다.
  }
}
