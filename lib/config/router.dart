import 'package:flutter/material.dart';
import '/presentation/screens/homepage/home_provider.dart';
import '/presentation/screens/splashpage/splash_page.dart';

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
      case "/":
        return getPageRoute(SplashPage());

      case "/home":
        return getPageRoute(HomeProvider());

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
