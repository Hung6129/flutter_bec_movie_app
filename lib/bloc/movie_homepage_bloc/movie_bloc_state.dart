part of 'movie_bloc_bloc.dart';

@immutable
abstract class MovieBlocState {}

class MovieBlocInitial extends MovieBlocState {}

class MovieBlocLoading extends MovieBlocState {}

class MovieBlocLoaded extends MovieBlocState {
  final List<Movie> nowPlayingList;
  final List<Movie> popularList;
  final List<MovieCast> peopleList;

  MovieBlocLoaded(
    this.nowPlayingList,
    this.popularList,
    this.peopleList,
  );

  List<Object> get props => [nowPlayingList, popularList, peopleList];
}

class MovieBlocError extends MovieBlocState {}
