import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bec_movie_app/widgets/constrant.dart';

// final List<MenuItem> options = [
//   MenuItem(Icons.payment, 'Payments'),
//   MenuItem(Icons.favorite, 'Discounts'),
//   MenuItem(Icons.notifications, 'Notification'),
//   MenuItem(Icons.format_list_bulleted, 'Orders'),
//   MenuItem(Icons.help, 'Help'),
// ];

class MenuPage extends StatelessWidget {
  MenuPage({Key? key}) : super(key: key);
  final menuItems = {
    "Favorite": Icon(Icons.favorite),
    "Favorite": Icon(Icons.favorite),
    "Favorite": Icon(Icons.favorite),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constrant.p4,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    minLeadingWidth: 20,
                    leading: Image.asset(
                      "assets/user.png",
                      width: 35,
                      height: 35,
                    ),
                    title: Text("hungnguyen"),
                    onTap: () {},
                  ),
                  ListTile(
                    minLeadingWidth: 20,
                    leading: Icon(CupertinoIcons.square_favorites_alt),
                    title: Text("Favorite"),
                    onTap: () {},
                  ),
                  ListTile(
                    minLeadingWidth: 20,
                    leading: Icon(Icons.watch_later),
                    title: Text("Watch List"),
                    onTap: () {},
                  ),
                  Divider(
                    thickness: 1,
                    indent: 5,
                    color: Constrant.p3,
                  ),
                  ListTile(
                    minLeadingWidth: 20,
                    leading: Icon(Icons.logout),
                    title: Text("Sign Out"),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
