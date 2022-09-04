import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/config/palettes.dart';

import 'package:google_fonts/google_fonts.dart';


class AppText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  const AppText(
      {Key? key,
      required this.text,
      this.size = 16,
      this.color = Palettes.textBlack,
      this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
