import 'dart:convert';

import 'package:flutter_http/models/product.model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  // pour chrome
  static String productUrl = "http://localhost:8000/products.json";
  // commande pour utiliser chrome a la place de l'émulateur, lancer le serveur local avec la commande suivante:
// http-server . --cors -p 8000

  // pour emulateur
  // static String productUrl = "http://192.168.1.206:8000/products.json";

  static Future<ProductList?> getProducts() async {
    try {
      final response = await http
          .get(Uri.parse(productUrl), headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        // success de l'appel de api
        if (response.body.isNotEmpty) {
          final jsonResponse =
              json.decode(response.body); //import 'dart:convert';
          // lancer factory
          final ProductList products = ProductList.fromJson(jsonResponse);

          if (products.products.isNotEmpty) {
            return products;
          } else {
            return null;
          }
        } else {
          return null;
        }
      } else {
        throw Exception('Impossible de chamger les produits1');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Impossible de charger les produits2');
    }
  }
}
