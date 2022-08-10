import 'package:flutter/material.dart';

class Constrant {
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

  /////// URL
  static const String apiKey = 'f6b0b868e75dbed8c0907797342365dc';

  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imagesUrl = 'https://image.tmdb.org/t/p/original';
  static const String langUrl = '&language=en-US&page=1';

  // detail movie
  static const String detailUrl = '/movie/';
  static const String detailApiKeyUrl =
      '?api_key=f6b0b868e75dbed8c0907797342365dc';

  // trending movie
  static const String movieUrlTrendingWeeks = '/trending/movie/week?api_key=';
  // popular movie
  static const String movieUrlPopularWeeks = '/movie/popular?api_key=';
  // get latest
  static const String latestTrailerUrl = '/movie/latest?api_key=';
  // get upcoming
  static const String upComingTrailerUrl = '/movie/upcoming?api_key=';
}
