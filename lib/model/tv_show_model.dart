class TVShowModel {
  String? backdropPath;
  String? firstAirDate;
  // List<int>? genreIds;
  int? id;
  String? name;
  // List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  // double? voteAverage;
  // int? voteCount;

  TVShowModel({
    this.backdropPath,
    this.firstAirDate,
    // this.genreIds,
    this.id,
    // this.name,
    // this.originCountry,
    // this.originalLanguage,
    // this.originalName,
    // this.overview,
    // this.popularity,
    this.posterPath,
    // this.voteAverage,
    // this.voteCount,
  });

  TVShowModel.fromJson(Map<String, dynamic> json) {
    // backdropPath = json['backdrop_path'];
    // firstAirDate = json['first_air_date'];
    // genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    // name = json['name'];
    // originCountry = json['origin_country'].cast<String>();
    // originalLanguage = json['original_language'];
    // originalName = json['original_name'];
    // overview = json['overview'];
    // popularity = json['popularity'];
    posterPath = json['poster_path'];
    // voteAverage = json['vote_average'];
    // voteCount = json['vote_count'];
  }
}
