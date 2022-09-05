import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Palettes {
  static TextStyle kBody = GoogleFonts.poppins(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: p3);
  static TextStyle kHeading6 = GoogleFonts.poppins(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: p3);
  static TextStyle bodyText = GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: textBlack);
  static TextStyle movieTitle = GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: p3);

  /// Text color
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textBlack = Color(0xFF000000);

  /// Main palette
  static const Color p1 = Color(0xFF191919);
  static const Color p2 = Color(0xFF2D4263);
  static const Color p3 = Color(0xFFC84B31);
  static const Color p4 = Color(0xFFECDBBA);

  ///
  static const Color p5 = Color(0xFFC0D8C0);
  static const Color p6 = Color(0xFFECB390);
  static const Color p7 = Color(0xFFC84B31);
  static const Color p8 = Color(0xFFF5EEDC);
  static const Color p9 = Color(0xFFC0D8C0);
}
