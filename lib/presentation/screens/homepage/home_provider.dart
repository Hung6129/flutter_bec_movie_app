import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/movie_homepage_bloc/movie_bloc_bloc.dart';
import '../../../bloc/tv_shows_bloc/tv_show_bloc.dart';
import '../../../repository/service/authenticate.dart';

class HomeProvider extends StatefulWidget {
  HomeProvider({Key? key}) : super(key: key);
  @override
  State<HomeProvider> createState() => _HomeProviderState();
}

class _HomeProviderState extends State<HomeProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBlocBloc>(
          create: (_) => MovieBlocBloc()..add(MovieEventStarted()),
        ),
        BlocProvider<TvShowBloc>(
          create: (_) => TvShowBloc()..add(TVShowEventStarted()),
        ),
      ],
      child: Authentication().handleAuthentication(),
    );
  }
}
