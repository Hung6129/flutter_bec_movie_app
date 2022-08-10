import 'package:flutter/material.dart';

class CastDetailPage extends StatelessWidget {
  const CastDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
