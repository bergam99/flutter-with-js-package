import 'package:flutter/material.dart';
import 'package:flutter_with_jc_2/components/opacity_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  final title = "Home Page";

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 15),
        vsync:
            this); // vsync : ça syncronise avec 'SingleTickerProviderStateMixin'.
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
  }

  @override //nottoyer le memoir quand c'est terminé
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
            // opaticy_animation je peux passer sur soit Container soit sur Column
            padding: const EdgeInsets.all(20),
            child: OpacityAnimation(
              animation: animation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("web/assets/img/iphone.png"),
                  Image.asset("web/assets/img/pixel.png"),
                ],
              ),
            )),
      ),
    );
  }
}
