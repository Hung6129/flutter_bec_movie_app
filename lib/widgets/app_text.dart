import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/config/palettes.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const AppText(
      {Key? key,
      required this.text,
      this.color = Palettes.textBlack,
      this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Palettes.bodyText);
  }
}
