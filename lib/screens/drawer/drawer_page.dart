import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/screens/drawer/menu_page.dart';
import 'package:flutter_bec_movie_app/screens/favoritepage/favorite_page.dart';
import 'package:flutter_bec_movie_app/screens/homepage/homepage.dart';
import 'package:flutter_bec_movie_app/screens/searchpage/search_page.dart';
import 'package:flutter_bec_movie_app/widgets/constrant.dart';
import 'package:flutter_bec_movie_app/widgets/menu_item.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final _drawerController = ZoomDrawerController();
  DrawerThings current = MenuItems.home;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _drawerController,
      menuScreen: Builder(builder: (context) {
        return MenuPage(
          currentItem: current,
          onSelectedItem: (item) {
            setState(() {
              current = item;
              ZoomDrawer.of(context)!.close();
            });
          },
        );
      }),
      mainScreen: _getMenuPage(),
      borderRadius: 24.0,
      mainScreenTapClose: true,
      showShadow: true,
      menuBackgroundColor: Constrant.p4,
      angle: -12.0,
      slideWidth: MediaQuery.of(context).size.width * .65,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
    );
  }

  Widget _getMenuPage() {
    switch (current) {
      case MenuItems.fav:
        return FavoritePage();
      case MenuItems.search:
        return SearchPage();
      case MenuItems.home:
        return HomePage();
    }
    return HomePage();
  }
}
