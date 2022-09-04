part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchHasData extends SearchState {
  final List<Movie> listResults;

  SearchHasData(this.listResults);

  @override
  List<Object> get props => [listResults];
}

class SearchNoData extends SearchState {}

class SearchError extends SearchState {}
