import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/homepage/home_provider.dart';


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
      home: HomeProvider(),
    );
  }
}
