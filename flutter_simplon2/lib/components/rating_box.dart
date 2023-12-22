import 'package:flutter/material.dart';

class RatingBox extends StatefulWidget {
  const RatingBox({super.key}); //

  @override
  State createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;
  double _size = 20;

  void _setRating(int rating) {
    if (rating == 3 && rating == 3) {
      setState(() {
        _rating = 0;
      });
      return; // je sors
    }

    setState(() {
      _rating = rating;
    });
  }
  //méthode build (en miniscle la fonction)

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment
            .end, // propriétaires majeures. si j'utilise un row c'est pour aligner qqc (horizontal)
        crossAxisAlignment: CrossAxisAlignment.end, // vertical
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              icon: (_rating >= 1
                  ? Icon(Icons.star, size: _size)
                  : Icon(
                      Icons.star_border,
                      size: _size,
                    )),
              color: Colors.red[500],
              iconSize: _size,
              onPressed: () {
                _setRating(1);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              icon: (_rating >= 2
                  ? Icon(Icons.star, size: _size)
                  : Icon(
                      Icons.star_border,
                      size: _size,
                    )),
              color: Colors.red[500],
              iconSize: _size,
              onPressed: () {
                _setRating(2);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              icon: (_rating >= 3
                  ? Icon(Icons.star, size: _size)
                  : Icon(
                      Icons.star_border,
                      size: _size,
                    )),
              color: Colors.red[500],
              iconSize: _size,
              onPressed: () {
                _setRating(3);
              },
            ),
          ),
        ]);
  }
}
