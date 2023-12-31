import 'package:flutter/material.dart';
import 'package:flutter_http/components/productLister.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Nos Produits"),
      ),
      body: const ProductLister(),
    );
  }
}
