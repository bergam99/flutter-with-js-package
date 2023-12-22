//un widget inseré dans product_page.

import 'package:flutter/material.dart';
import 'package:flutter_simplon2/components/rating_box.dart';

class ProductBox extends StatelessWidget {
  const ProductBox({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  final String name;
  final String description;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 200,
      child: Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset("web/assets/img/$image"),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        //deuxieme enfant
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(//3e enfant
                          description),
                      Text("Prix: ${price.toString()}₩"),
                      const RatingBox(),
                    ]),
              ))
            ] // children prend un liste de Widget,
            ),
      ),
    );
  }
}

// tree : MyAPP > Product_Page > SCAFFOLD > Product_Box > Container > Card > Row > Image, {Expanded > Container > Column > Text *3}