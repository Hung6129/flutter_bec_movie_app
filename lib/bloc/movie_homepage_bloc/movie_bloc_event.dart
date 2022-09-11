part of 'movie_bloc_bloc.dart';

@immutable
abstract class MovieBlocEvent {}

class MovieEventStarted extends MovieBlocEvent {
  // final int movieId;
  // final String query;

  MovieEventStarted(
      // this.movieId,
      // this.query,
      );

  @override
  List<Object> get props => [];
}
