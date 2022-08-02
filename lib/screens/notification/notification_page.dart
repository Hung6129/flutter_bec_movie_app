import 'package:flutter/material.dart';

import '../../widgets/app_text.dart';
import '../../widgets/constrant.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constrant.p1,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Constrant.p2,
          title: const AppText(
            text: "Favorite List",
            size: 24,
            color: Constrant.p3,
          ),
        ),
        body: Container(
          color: Colors.yellow,
        ));
  }
}
