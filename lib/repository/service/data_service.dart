import 'package:dio/dio.dart';
import 'package:flutter_bec_movie_app/config/urls.dart';
import '../../data_layer/model/cast_model.dart';
import '../../data_layer/model/movie_cast.dart';
import '../../data_layer/model/movie_detail_model.dart';
import '../../data_layer/model/movie_model.dart';
import '../../data_layer/model/tv_show_detail_model.dart';
import '../../data_layer/model/tv_show_model.dart';

class DataService {
  final Dio _dio = Dio();

/////////// Search
  /// get a list of result from user searching query
  Future<List<Movie>> fetchingListResult(String query) async {
    try {
      final res = await _dio.get(Urls.searchMovies(query));
      var result = res.data['results'] as List;
      List<Movie> resultList = result.map((e) => Movie.fromJson(e)).toList();
      return resultList;
    } catch (e, st) {
      throw Exception("Exception accoured: $e with stacktrace:  $st");
    }
  }

////////// TV shows
  /// get list top rated tv show
  Future<List<TVShowModel>> fetchTopRatedTVShow() async {
    try {
      final res = await _dio.get(Urls.onTheAirTvs);
      var tvShows = res.data['results'] as List;
      List<TVShowModel> tvShowList =
          tvShows.map((e) => TVShowModel.fromJson(e)).toList();
      return tvShowList;
    } catch (error, stacktrace) {
      throw Exception(
          "Exception accoured: $error with stacktrace: $stacktrace");
    }
  }

  /// get list air playing tv show
  Future<List<TVShowModel>> fetchAirPlayingTVShow() async {
    try {
      final res = await _dio.get(Urls.topRatedTvs);
      var tvShow = res.data['results'] as List;
      List<TVShowModel> tvShowlList =
          tvShow.map((e) => TVShowModel.fromJson(e)).toList();
      return tvShowlList;
    } catch (error, stacktrace) {
      throw Exception(
          "Exception accoured: $error with stacktrace: $stacktrace");
    }
  }

  /// get tv show detail by tv show id
  Future<TVShowDetailModel> fetchTVShowDetail(int tvId) async {
    try {
      final res = await _dio.get(Urls.tvDetail(tvId));
      TVShowDetailModel tvShowDetail = TVShowDetailModel.fromJson(res.data);
      tvShowDetail.trailerId = await getYoutubeTVShowId(tvId);

      // movieDetail.movieImage = await getMovieImage(id);

      tvShowDetail.topBillCastedList = await getTopCastedTVShowList(tvId);
      // tvShowDetail.recommendedList = await getRecommendationList(tvId);
      return tvShowDetail;
    } catch (error, stacktrace) {
      throw Exception(
          "Exception accoured: $error with stacktrace: $stacktrace");
    }
  }

  /// get a recommended list from tvId to show in the detail tv show
  Future<List<TVShowModel>> getRecommendationTVShowList(int tvId) async {
    try {
      final res = await _dio.get(Urls.tvRecommendations(tvId));
      var tvShows = res.data['results'] as List;
      List<TVShowModel> tvShowList =
          tvShows.map((e) => TVShowModel.fromJson(e)).toList();

      return tvShowList;
    } catch (error, stacktrace) {
      throw Exception(
          "Exception accoured: $error with stacktrace: $stacktrace");
    }
  }

  /// get movie cast credit list by tvId
  Future<List<MovieCast>> getTopCastedTVShowList(int tvId) async {
    try {
      final response = await _dio.get(Urls.tvShowCredits(tvId));
      var list = response.data['cast'] as List;
      List<MovieCast> castList = list
          .map(
            (c) => MovieCast(
              name: c['name'],
              profilePath: c['profile_path'],
              character: c['character'],
              id: c['id'],
            ),
          )
          .toList();
      return castList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  /// getting youtubeId by using tvId
  Future<String> getYoutubeTVShowId(int tvId) async {
    try {
      final response = await _dio.get(Urls.tvShowTrailer(tvId));
      var youtubeId = response.data['results'][0]['key'];
      return youtubeId;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

/////////// Movies
  /// get list top rated movie
  Future<List<Movie>> fetchTopRatedMovie() async {
    try {
      final res = await _dio.get(Urls.topRatedMovies);
      var movies = res.data['results'] as List;
      List<Movie> movieList = movies.map((e) => Movie.fromJson(e)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          "Exception accoured: $error with stacktrace: $stacktrace");
    }
  }

  /// get list now playing movie
  Future<List<Movie>> fetchNowPlayingMovie() async {
    try {
      final res = await _dio.get(Urls.nowPlayingMovies);
      var movies = res.data['results'] as List;
      List<Movie> movieList = movies.map((e) => Movie.fromJson(e)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          "Exception accoured: $error with stacktrace: $stacktrace");
    }
  }

  /// fetching list of popular movie
  Future<List<Movie>> fetchPopularMovie() async {
    try {
      final res = await _dio.get(Urls.popularMovies);
      var movies = res.data['results'] as List;
      List<Movie> movieList = movies.map((e) => Movie.fromJson(e)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          "Exception accoured: $error with stacktrace: $stacktrace");
    }
  }

////////////// Cast
  /// get popular people list
  Future<List<MovieCast>> fetchPopularCast() async {
    try {
      final res = await _dio.get(Urls.popularCast);
      var people = res.data['results'] as List;
      List<MovieCast> peopleList =
          people.map((e) => MovieCast.fromJson(e)).toList();
      return peopleList;
    } catch (error, stacktrace) {
      throw Exception(
          "Exception accoured: $error with stacktrace: $stacktrace");
    }
  }

  /// using castId from cast list to get cast detail
  Future<CastModel> fetchCastDetail(int castId) async {
    try {
      final res = await _dio.get(Urls.castDetail(castId));
      CastModel castDetail = CastModel.fromJson(res.data);
      return castDetail;
    } catch (error, stacktrace) {
      throw Exception(
          "Exception accoured: $error with stacktrace: $stacktrace");
    }
  }

  /// get cast credit movie using castId
  Future<List<Movie>> fetchCastCreditMovie(int castId) async {
    try {
      final res = await _dio.get(Urls.castMovieCredits(castId));
      var creditMovie = res.data['cast'] as List;
      List<Movie> creditsList =
          creditMovie.map((e) => Movie.fromJson(e)).toList();
      return creditsList;
    } catch (error, stacktrace) {
      throw Exception(
          "Exception accoured: $error with stacktrace: $stacktrace");
    }
  }

////////////// Detail Movie
  /// get movie detail by movie id
  Future<MovieDetail> fetchDetailMovie(int movieId) async {
    try {
      final res = await _dio.get(Urls.movieDetail(movieId));
      MovieDetail movieDetail = MovieDetail.fromJson(res.data);
      movieDetail.trailerId = await getYoutubeId(movieId);

      // movieDetail.movieImage = await getMovieImage(id);

      movieDetail.topBillCastedList = await getTopCastedList(movieId);
      movieDetail.recommendedList = await getRecommendationList(movieId);

      return movieDetail;
    } catch (error, stacktrace) {
      throw Exception(
          "Exception accoured: $error with stacktrace: $stacktrace");
    }
  }

  /// get a recommended list from movieId to show in the detail movie
  Future<List<Movie>> getRecommendationList(int movieId) async {
    try {
      final res = await _dio.get(Urls.movieRecommendations(movieId));
      var movies = res.data['results'] as List;
      List<Movie> movieList = movies.map((e) => Movie.fromJson(e)).toList();

      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          "Exception accoured: $error with stacktrace: $stacktrace");
    }
  }

  /// get movie cast credit list by movieId
  Future<List<MovieCast>> getTopCastedList(int movieId) async {
    try {
      final response = await _dio.get(Urls.movieCredits(movieId));
      var list = response.data['cast'] as List;
      List<MovieCast> castList = list
          .map(
            (c) => MovieCast(
              name: c['name'],
              profilePath: c['profile_path'],
              character: c['character'],
              id: c['id'],
            ),
          )
          .toList();
      return castList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  /// getting youtubeId by using movieId
  Future<String> getYoutubeId(int movieId) async {
    try {
      final response = await _dio.get(Urls.movieTrailer(movieId));
      var youtubeId = response.data['results'][0]['key'];
      return youtubeId;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
