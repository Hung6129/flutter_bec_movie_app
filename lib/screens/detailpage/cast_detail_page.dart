import 'package:flutter/material.dart';

class CastDetailPage extends StatelessWidget {
  const CastDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    )),
                Positioned(
                    right: 0,
                    child: Container(
                      height: 500,
                      width: 300,
                      color: Colors.blueAccent,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
