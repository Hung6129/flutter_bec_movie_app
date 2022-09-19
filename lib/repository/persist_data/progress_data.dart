import 'dart:convert';

import 'package:flutter_bec_movie_app/data_layer/model/movie_detail_model.dart';

class PersitsData {
  List<String> movieListString = [];
  Future<void> addToFavoriteList(MovieDetail movieList) async {
    print(jsonEncode(movieList));
    return movieListString.add(jsonEncode(movieList));
  }
}
