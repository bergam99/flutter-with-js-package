//  Dart의 http 패키지를 사용하여 HTTP 요청을 처리하고, 서버로부터 받은 JSON 데이터를 모델링한 ArticleList 클래스로 변환합니다.
import 'dart:convert'; //SON 디코딩을 위한 Dart의 내장 라이브러리

import 'package:flutter_http/models/article.model.dart';
import 'package:http/http.dart' as http; //: HTTP 요청을 처리하기 위한 http 패키지입니다.

class ArticleService {
  // pour chrome
  static String articletUrl =
      "http://localhost:8000/articles.json"; // articletUrl은 서버에서 뉴스 기사 목록을 가져오기 위한 엔드포인트 URL을 나타냅니다.
  // commande pour utiliser chrome a la place de l'émulateur, lancer le serveur local avec la commande suivante:
// http-server . --cors -p 8000

  // pour emulateur
  // static String productUrl = "http://192.168.1.206:8000/products.json";

  // méthode getproduct async
  // Future c'est une promisse.
  static Future<ArticleList?> getArticles() async {
    //HTTP GET 요청을 사용하여 서버에서 뉴스 기사 데이터를 가져오는 메서드입니다.
    try {
      //try-catch 블록 내에서 HTTP 요청 및 응답을 처리합니다.
      final response = await http.get(Uri.parse(articletUrl), headers: {
        "Accept": "application/json"
      }); // 서버로부터 데이터를 가져오기 위한 비동기 HTTP GET 요청을 수행합니다.

      if (response.statusCode == 200) {
        //HTTP 응답이 성공인 경우
        // success de l'appel de api
        if (response.body.isNotEmpty) {
          final jsonResponse =
              json.decode(response.body); // 서버에서 받은 JSON 데이터를 Dart 객체로 디코딩합니다.
          // lancer factory
          final ArticleList articles = ArticleList.fromJson(jsonResponse[
              "articles"]); // JSON 데이터를 기반으로 ArticleList 클래스의 인스턴스를 생성합니다.

          if (articles.articles.isNotEmpty) {
            return articles;
          } else {
            return null; //메서드의 반환값은 ArticleList 객체이거나 null입니다.
          }
        } else {
          return null;
        }
      } else {
        //에러가 발생하면 catch 블록에서 해당 예외를 출력하고 예외 메시지를 던집니다.
        throw Exception('Impossible de chamger les articles1');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Impossible de charger les articles2');
    }
  }
}
