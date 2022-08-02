import 'package:flutter/material.dart';

import '../../widgets/app_text.dart';
import '../../widgets/constrant.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constrant.textWhite,
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Constrant.p2,
      //   title: const AppText(
      //     text: "Favorite List",
      //     size: 24,
      //     color: Constrant.p3,
      //   ),
      // ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 60,
            child: Center(
              child: AppText(
                text: "Favorite List",
                size: 25,
                color: Constrant.p3,
              ),
            ),
          ),
          // const SizedBox(
          //   height: 60,
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 100,
              color: Constrant.p6,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 100,
                    color: Colors.red,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      AppText(text: "The Boys"),
                      AppText(text: "9.0/10"),
                      AppText(text: "Top list"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
