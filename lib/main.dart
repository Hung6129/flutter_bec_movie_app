import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/presentation/screens/splashpage/splash_page.dart';

import 'config/router.dart';

const favoritesBox = 'favorite_movies';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BecMovie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      onGenerateRoute: AppRoutes.onGeneratedRoutes,
      home: SplashPage(),
    );
  }
}
