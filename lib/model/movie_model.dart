class Movie {
  bool? adult;
  String? backdropPath;
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  // List<int>? genreIds;
  String? popularity;
  String? releaseDate;
  // bool? video;
  String? voteAverage;
  String? voteCount;

  Movie(
      {this.adult,
      this.backdropPath,
      this.id,
      this.title,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.mediaType,
      // this.genreIds,
      this.popularity,
      this.releaseDate,
      // this.video,
      this.voteAverage,
      this.voteCount});

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    title = json['title'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    // genreIds = json['genre_ids'].cast<int>();
    popularity = json['popularity'].toString();
    releaseDate = json['release_date'];
    // video = json['video'];
    voteAverage = json['vote_average'].toString();
    voteCount = json['vote_count'].toString();
  }
}
