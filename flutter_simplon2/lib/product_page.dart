import 'package:flutter/material.dart';
import 'package:flutter_simplon2/components/product_box.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const ProductPage(title: 'Our products...'),
    );
  }
}

// -------

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.title});
  final String title;

  void _showDialog(BuildContext context, String txt) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //ici on pass réellement
          return AlertDialog(
            title: const Text("Message <3"),
            content: Text("Vous avez tapoté sur $txt"),
            actions: <Widget>[
              CloseButton(
                //fermer le modal
                onPressed: () {
                  Navigator.of(context)
                      .pop(); //pop : enlève. (alerte est totalement une autre page, onpress -> pop)
                  //fonction annonyme
                },
              ),
            ],
          ); // widget
        }); // méthode "Alerte" de flutter
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        shrinkWrap: true, //quand la taille d'ecran change ça adapte
        padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
        children: <Widget>[
          GestureDetector(
            // GestureDetector c'est un widget donc il y a des propriétaire.
            // GestureDetector prend un seul enfant.
            onTap: () {
              _showDialog(context, "iphone");
            },
            child: const ProductBox(
                name: "iPhone",
                description: "Super iPhone",
                price: 600,
                image: "iphone.png"),
          ),
          GestureDetector(
            onTap: () {
              _showDialog(context, "pixel");
            },
            child: const ProductBox(
                name: "Pixel",
                description: "Super pixel",
                price: 600,
                image: "pixel.png"),
          ),
          GestureDetector(
            onTap: () {
              _showDialog(context, "laptop");
            },
            child: const ProductBox(
                name: "laptop",
                description: "Super laptop",
                price: 600,
                image: "laptop.png"),
          ),
          GestureDetector(
            onTap: () {
              _showDialog(context, "tablet");
            },
            child: const ProductBox(
                name: "Tablet",
                description: "Super Tablet",
                price: 1000,
                image: "tablet.png"),
          ),
        ],
      ),
    );
  }
}
