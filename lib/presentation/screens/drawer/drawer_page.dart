import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/config/palettes.dart';

import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../widgets/menu_item.dart';
import '../favoritepage/favorite_page.dart';
import '../homepage/homepage.dart';
import '../searchpage/search_page.dart';
import '../tvs/tv_shows.dart';
import 'menu_page.dart';

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
      slideWidth: 200,

      mainScreenTapClose: true,
      menuBackgroundColor: Palettes.p4,
      // slideWidth: MediaQuery.of(context).size.width * .65,
      // openCurve: Curves.fastOutSlowIn,
      // closeCurve: Curves.bounceIn,
      // borderRadius: 24.0,
      drawerShadowsBackgroundColor: Palettes.p4,
      // showShadow: true,
      angle: 0.0,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
    );
  }

  Widget _getMenuPage() {
    switch (current) {
      case MenuItems.home:
        return HomePage();
      case MenuItems.fav:
        return FavoritePage();
      case MenuItems.search:
        return SearchPage();
      case MenuItems.tvs:
        return TVShows();
    }
    return HomePage();
  }
}
