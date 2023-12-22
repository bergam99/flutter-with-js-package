import 'package:flutter/material.dart';

class OpacityAnimation extends StatelessWidget {
  const OpacityAnimation(
      {super.key, required this.child, required this.animation});

  final Widget child;
  final Animation<double> animation;

  @override // (=>) wrapper. tous ce qui est enfant de cela ça anime
  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
          // builder : builder dynamiquement. fabriquer au moment de execution.
          animation: animation,
          builder: (context, child) => Container(
            // context : t'es dans quoi? ( il a besoin de savoir son widget parents ) => c'est dans home_page, body les deux images.
            padding: const EdgeInsets.all(10),
            child: Opacity(
              opacity: animation.value,
              child: child,
            ),
          ),
          child: child,
        ),
      );
}
