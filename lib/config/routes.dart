import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/bloc/movie_homepage_bloc/movie_bloc_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/screens/drawer/drawer_page.dart';

class AppRoutes {
  static MaterialPageRoute getMaterialRoute(screen) {
    return MaterialPageRoute(builder: (context) => screen);
  }

  static PageRouteBuilder getPageRoute(screen) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 300),
      reverseTransitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, _, __) => screen,
    );
  }

  static Route? onGeneratedRoutes(RouteSettings route) {
    switch (route.name) {
      // case "/":
      //   return getPageRoute(SplashScreen());

      case "/home":
        return getPageRoute(BlocProvider(
          create: (context) => MovieBlocBloc(),
          child: DrawerPage(),
        ));

      // case "/search":
      //   final WikiSearchArgs? args = route.arguments as WikiSearchArgs?;
      //   return getMaterialRoute(
      //     BlocProvider(
      //       create: (context) => SearchcacheCubit(),
      //       child: SearchScreen(
      //         searchKeyword: args == null ? null : args.searchKeyword,
      //       ),
      //     ),
      //   );

      // case "/wikiResults":
      //   final args = route.arguments as WikiSearchArgs;
      //   return getPageRoute(
      //     BlocProvider(
      //       create: (context) => WikisearchCubit(),
      //       child: SearchResults(searchKeyword: args.searchKeyword),
      //     ),
      //   );

      // case "/webview":
      //   final args = route.arguments as WebViewArgs;
      //   return getMaterialRoute(WikiWebView(url: args.url));
    }
  }
}
