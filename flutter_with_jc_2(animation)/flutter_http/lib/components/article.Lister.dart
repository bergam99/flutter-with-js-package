// json -> model -> service -> main button -> page -> component

// 화면에 표시하는 위젯(ArticleLister)을 구현한 것
import 'package:flutter/material.dart';
import 'package:flutter_http/models/article.model.dart';
import 'package:flutter_http/services/article.service.dart';

class ArticleLister extends StatefulWidget {
  //stateful
  const ArticleLister({super.key});

  @override
  State<ArticleLister> createState() =>
      _ArticleListeState(); //상태 관리를 위한 상태 클래스 _ArticleListeState를 가집니다.
}

class _ArticleListeState extends State<ArticleLister> {
  late Future<ArticleList?> articles;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() {
    //loadProducts 메서드는 ArticleService.getArticles()를 호출하여 뉴스 기사를 가져오고, 상태를 갱신합니다.
    setState(() {
      //setState 메서드를 사용하여 articles 변수를 업데이트합니다.
      articles = ArticleService.getArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: articles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //snapshot.hasData가 true인 경우, 데이터가 도착한 상태이므로 ListView.builder를 사용하여 뉴스 기사 목록을 화면에 출력합니다.
            List<Article> articles = snapshot.data!.articles;
            return ListView.builder(
                //동적인 목록을 생성
                itemCount: snapshot.data!.articles.length, //동적인 목록을 생성
                itemBuilder: (context, index) {
                  // 각 항목에 대한 UI를 생성합니다. 여기서는 Card와 ListTile을 사용하여 기사를 나타내고 있습니다.
                  Article article = articles[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      // You can customize Card properties here
                      child: ListTile(
                        title: Text(
                            "${article.title} de {$article.author} - ${article.source.name}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(article.description),
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
            //snapshot.hasError가 true인 경우, 데이터 가져오기에 실패한 상황을 처리하고 에러 메시지를 출력합니다.
            return Text("error: ${snapshot.error}");
          }
          //그 외의 경우, 데이터가 아직 도착하지 않았으므로 로딩 스피너를 표시합니다.
          return const Center(
            child: CircularProgressIndicator(), // spinner
          );
        });
  }
}
