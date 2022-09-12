part of 'tv_show_detail_bloc.dart';

@immutable
abstract class TVShowDetailState {}

class TVShowDetailInitial extends TVShowDetailState {}

class TVShowDetailLoading extends TVShowDetailState {}

class TVShowDetailLoaded extends TVShowDetailState {
  final TVShowDetailModel detail;
  final List<TVShowModel> recommendation;
  TVShowDetailLoaded(
    this.detail,
    this.recommendation,
  );
  @override
  List<Object> get props => [
        detail,
        recommendation,
      ];
}

class TVShowDetailError extends TVShowDetailState {
  final String error;

  TVShowDetailError(this.error);
}
