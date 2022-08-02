import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'constrant.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  const AppText(
      {Key? key,
      required this.text,
      this.size = 16,
      this.color = Constrant.textBlack,
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
