import 'movie_cast.dart';

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
  String? voteAverage;
  String? voteCount;
  String? poster_path;
  String? tagline;
  String? popularity;
  late String trailerId;
  late List<MovieCast> castList;

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
    voteAverage = json['vote_average'].toString();
    voteCount = json['vote_count'].toString();
    poster_path = json['poster_path'].toString();
    tagline = json['tagline'].toString();
    popularity = json['popularity'].toString();
  }
}
