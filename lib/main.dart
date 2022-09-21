import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/bloc/tv_shows_bloc/tv_show_bloc.dart';
import '/repository/service/authenticate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/movie_homepage_bloc/movie_bloc_bloc.dart';
// import 'config/routes.dart';

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
      // onGenerateRoute: AppRoutes.onGeneratedRoutes,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MovieBlocBloc>(
            create: (_) => MovieBlocBloc()..add(MovieEventStarted()),
          ),
          BlocProvider<TvShowBloc>(
            create: (_) => TvShowBloc()..add(TVShowEventStarted()),
          ),
        ],
        child: Authentication().handleAuthentication(),
      ),
    );
  }
}
