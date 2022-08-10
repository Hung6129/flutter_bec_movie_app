import 'package:dio/dio.dart';
import 'package:flutter_bec_movie_app/model/movie_detail_model.dart';

import '../model/movie_cast.dart';
import '../model/movie_model.dart';
import '../widgets/constrant.dart';

class DataService {
  final Dio _dio = Dio();

  Future<List<Movie>> fetchTrendingMovie() async {
    try {
      final res = await _dio.get(Constrant.baseUrl +
          Constrant.movieUrlTrendingWeeks +
          Constrant.apiKey +
          Constrant.langUrl);
      var movies = res.data['results'] as List;
      List<Movie> movieList = movies.map((e) => Movie.fromJson(e)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          "Exception accoured: $error with stacktrace: $stacktrace");
    }
  }

  Future<List<Movie>> fetchPopularMovie() async {
    try {
      final res = await _dio.get(Constrant.baseUrl +
          Constrant.movieUrlPopularWeeks +
          Constrant.apiKey);
      var movies = res.data['results'] as List;
      List<Movie> movieList = movies.map((e) => Movie.fromJson(e)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          "Exception accoured: $error with stacktrace: $stacktrace");
    }
  }

  Future<MovieDetail> fetchDetailMovie(int id) async {
    try {
      final res = await _dio.get(Constrant.baseUrl +
          Constrant.detailUrl +
          id.toString() +
          Constrant.detailApiKeyUrl +
          Constrant.langUrl);
      MovieDetail movieDetail = MovieDetail.fromJson(res.data);
      movieDetail.trailerId = await getYoutubeId(id);

      // movieDetail.movieImage = await getMovieImage(id);

      movieDetail.castList = await getCastList(id);

      return movieDetail;
    } catch (error, stacktrace) {
      throw Exception(
          "Exception accoured: $error with stacktrace: $stacktrace");
    }
  }

  Future<String> getYoutubeId(int id) async {
    try {
      final response = await _dio.get(
          'https://api.themoviedb.org/3/movie/$id/videos?api_key=f6b0b868e75dbed8c0907797342365dc');
      var youtubeId = response.data['results'][0]['key'];
      return youtubeId;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<MovieCast>> getCastList(int movieId) async {
    try {
      final response = await _dio.get(
          '${Constrant.baseUrl}/movie/$movieId/credits?api_key=${Constrant.apiKey}');
      var list = response.data['cast'] as List;
      List<MovieCast> castList = list
          .map((c) => MovieCast(
              name: c['name'],
              profilePath: c['profile_path'],
              character: c['character']))
          .toList();
      return castList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Movie>> getRecommendationList(int movieId) async {
    try {
      final res = await _dio.get(
          "https://api.themoviedb.org/3/movie/$movieId/recommendations?api_key=f6b0b868e75dbed8c0907797342365dc");
      var movies = res.data['results'] as List;
      List<Movie> movieList = movies.map((e) => Movie.fromJson(e)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          "Exception accoured: $error with stacktrace: $stacktrace");
    }
  }
}
