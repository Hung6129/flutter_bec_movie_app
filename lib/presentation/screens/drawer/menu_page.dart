import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/config/palettes.dart';
import 'package:flutter_bec_movie_app/config/text_style.dart';

import '../../../repository/service/authenticate.dart';
import '../../widgets/app_text.dart';
import '../../widgets/menu_item.dart';

class MenuItems {
  static const home = DrawerThings("Home Page", Icons.home_filled);
  // static const movies = DrawerThings("Movies", Icons.movie_sharp);
  static const tvs = DrawerThings("TV Shows", Icons.tv_sharp);
  static const search = DrawerThings("Search Page", Icons.search);
  static const fav = DrawerThings("Favorite List", Icons.favorite);
  static const watlis = DrawerThings("Watch List", Icons.watch_later);
  // static final siout = DrawerThings("Sign Out", Icons.logout);

  static final listItems = <DrawerThings>[home, tvs, search, fav, watlis];
}

class MenuPage extends StatelessWidget {
  final DrawerThings currentItem;
  final ValueChanged<DrawerThings> onSelectedItem;
  final String _currentUserName =
      FirebaseAuth.instance.currentUser!.displayName!;
  final String _currentUserImage = FirebaseAuth.instance.currentUser!.photoURL!;
  MenuPage({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildMenuItem(DrawerThings item) => ListTile(
          minLeadingWidth: 20,
          selectedColor: Palettes.p6,
          selectedTileColor: Palettes.p6,
          selected: currentItem == item,
          // tileColor: Palettes.p3,
          leading: Icon(item.IconData, color: Palettes.p3),
          title: AppText(text: item.String),
          onTap: () {
            onSelectedItem(item);
          },
        );

    return Scaffold(
      backgroundColor: Palettes.p4,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              minLeadingWidth: 20,
              selectedColor: Palettes.p6,
              selectedTileColor: Palettes.p6,
              // tileColor: Palettes.p3,
              leading: Image.network(
                _currentUserImage,
                width: 35,
                height: 35,
              ),
              title: AppText(
                text: _currentUserName,
              ),
              onTap: () {},
            ),
            SizedBox(
              height: 10,
            ),
            ...MenuItems.listItems.map(_buildMenuItem).toList(),
            Divider(
              thickness: 1,
              indent: 5,
              color: Palettes.p3,
            ),
            ListTile(
              minLeadingWidth: 20,
              leading: Icon(Icons.logout),
              title: Text(
                "Sign Out",
                style: TextStyles.defaultStyle,
              ),
              onTap: () async {
                await Authentication().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
