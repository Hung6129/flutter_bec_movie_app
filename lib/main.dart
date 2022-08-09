import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/service/authenticate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/movie_homepage_bloc/movie_bloc_bloc.dart';
import 'screens/detailpage/cast_detail_page.dart';

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
      title: 'Flutter BecMovie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home:
          // CastDetailPage()
          MultiBlocProvider(
        providers: [
          BlocProvider<MovieBlocBloc>(
            create: (_) => MovieBlocBloc()..add(MovieEventStarted(0, '')),
          ),
        ],
        child: Authentication().handleAuthentication(),
      ),
    );
  }
}
