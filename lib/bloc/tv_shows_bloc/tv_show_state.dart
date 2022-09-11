part of 'tv_show_bloc.dart';

abstract class TvShowState extends Equatable {
  const TvShowState();

  @override
  List<Object> get props => [];
}

class TvShowInitial extends TvShowState {}

class TvShowLoading extends TvShowState {}

class TvShowLoaded extends TvShowState {
  final List<TVShowModel> listTopRated;
  final List<TVShowModel> listAiringToday;
  // final List<TVShowModel> listPopular;

  TvShowLoaded(this.listTopRated, this.listAiringToday);
  @override
  List<Object> get props => [listTopRated, listAiringToday];
}

class TvShowError extends TvShowState {}
