part of 'movie_bloc_bloc.dart';

@immutable
abstract class MovieBlocState {}

class MovieBlocInitial extends MovieBlocState {}

class MovieBlocLoading extends MovieBlocState {}

class MovieBlocLoaded extends MovieBlocState {
  final List<Movie> movieList;
  final List<Movie> popularList;

  MovieBlocLoaded(
    this.movieList,
    this.popularList,
  );

  List<Object> get props => [
        movieList,
        popularList,
      ];
}

class MovieBlocError extends MovieBlocState {}
