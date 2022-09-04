import 'movie_cast.dart';
import 'movie_model.dart';

class MovieDetail {
  String? id;
  String? title;
  String? backdropPath;
  String? budget;
  String? homePage;
  String? originalTitle;
  String? overview;
  String? releaseDate;
  String? runtime;
  double? voteAverage;
  int? voteCount;
  String? poster_path;
  String? tagline;
  double? popularity;
  late String trailerId;
  late List<MovieCast> topBillCastedList;
  late List<Movie> recommendedList;

  MovieDetail({
    this.backdropPath,
    this.budget,
    this.id,
    this.originalTitle,
    this.overview,
    this.releaseDate,
    this.runtime,
    this.title,
    this.voteAverage,
    this.voteCount,
    this.poster_path,
    this.tagline,
    this.popularity,
  });

  MovieDetail.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];

    budget = json['budget'].toString();

    id = json['id'].toString();
    originalTitle = json['original_title'];
    overview = json['overview'];

    releaseDate = json['release_date'];
    runtime = json['runtime'].toString();

    title = json['title'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    poster_path = json['poster_path'].toString();
    tagline = json['tagline'].toString();
    popularity = json['popularity'];
  }
}
