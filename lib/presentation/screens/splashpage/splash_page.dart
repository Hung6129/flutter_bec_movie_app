import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/config/palettes.dart';
import 'package:flutter_bec_movie_app/presentation/screens/homepage/home_provider.dart';
import 'package:simple_animations/simple_animations.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    getMainPage();
  }

  void getMainPage() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => HomeProvider(),
      ),
    );
  }

  // Specify your tween
  final tween = MovieTween()
    ..tween('x', Tween(begin: -100.0, end: 100.0),
            duration: const Duration(seconds: 1))
        .thenTween('y', Tween(begin: -100.0, end: 100.0),
            duration: const Duration(seconds: 1))
        .thenTween('x', Tween(begin: 100.0, end: -100.0),
            duration: const Duration(seconds: 1))
        .thenTween('y', Tween(begin: 100.0, end: -100.0),
            duration: const Duration(seconds: 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palettes.p4,
      body: LoopAnimationBuilder<Movie>(
        tween: tween, // Pass in tween
        duration: tween.duration, // Obtain duration
        builder: (context, value, child) {
          return Transform.translate(
            // Get animated offset
            offset: Offset(value.get('x'), value.get('y')),
            child: Center(
              child: Image.asset(
                "assets/iHun.png",
                width: 300,
                height: 300,
              ),
            ),
          );
        },
      ),
    );
  }
}
