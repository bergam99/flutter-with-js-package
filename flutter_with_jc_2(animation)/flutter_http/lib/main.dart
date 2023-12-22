import 'package:flutter/material.dart';
import 'package:flutter_http/pages/article_page.dart';
import 'package:flutter_http/pages/product_page.dart';
import 'package:flutter_http/pages/student_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Accueil"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // =================== ElevatedButton =====================
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ProductPage(),
                      ));
                },
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size.fromWidth(200)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Products Page"),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                )),

            // =================== ElevatedButton =====================
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ArticlePage(),
                      ));
                },
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size.fromWidth(200)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Articles"),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                )),
            // =================== ElevatedButton =====================
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const StudentPage(all: false), //all
                      ));
                },
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size.fromWidth(200)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Student - ONE"),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                )),
            // ==========================================================
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const StudentPage(all: true), //all
                      ));
                },
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size.fromWidth(200)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Student - ALL"),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                )),
            // ==========================================================
          ],
        ),
      ),
    );
  }
}
