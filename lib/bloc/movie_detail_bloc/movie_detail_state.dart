part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetail detail;
  final List<Movie> recommendation;
  MovieDetailLoaded(this.detail, this.recommendation);
  @override
  List<Object> get props => [detail, recommendation];
}

class MovieDetailError extends MovieDetailState {}
