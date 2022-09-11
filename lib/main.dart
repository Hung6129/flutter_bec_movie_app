import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/bloc/tv_shows_bloc/tv_show_bloc.dart';
import 'package:flutter_bec_movie_app/screens/drawer/drawer_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/movie_homepage_bloc/movie_bloc_bloc.dart';
import 'config/routes.dart';
import 'config/view/erorr_page.dart';
import 'screens/tvs/tv_shows.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MovieBlocBloc>(
            create: (_) => MovieBlocBloc()..add(MovieEventStarted()),
          ),
          BlocProvider<TvShowBloc>(
            create: (_) => TvShowBloc()..add(TVShowEventStarted()),
          ),
        ],
        child: TVShows(),
      ),
    );
  }
}
