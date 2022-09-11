part of 'tv_show_bloc.dart';

abstract class TvShowEvent extends Equatable {
  const TvShowEvent();

  @override
  List<Object> get props => [];
}

class TVShowEventStarted extends TvShowEvent {
  // final int tvShowId;
  // final String query;

  TVShowEventStarted(
      // this.tvShowId,
      // this.query,
      );

  @override
  List<Object> get props => [];
}
