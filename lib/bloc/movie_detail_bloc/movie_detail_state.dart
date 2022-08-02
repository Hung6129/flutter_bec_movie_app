part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetail detail;
  MovieDetailLoaded(this.detail);

  @override
  List<Object> get props => [detail];
}

class MovieDetailError extends MovieDetailState {
  late String error;
  MovieDetailError(this.error);

  @override
  List<Object> get props => [error];
}
