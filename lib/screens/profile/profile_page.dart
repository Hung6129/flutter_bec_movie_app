import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/config/palettes.dart';

import '../../widgets/app_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palettes.p1,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Palettes.p2,
          title: const AppText(
            text: "Favorite List",
            size: 24,
            color: Palettes.p3,
          ),
        ),
        body: Container(
          color: Colors.yellow,
        ));
  }
}
