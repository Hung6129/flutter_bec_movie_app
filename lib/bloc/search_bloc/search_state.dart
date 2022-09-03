part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchHasData extends SearchState {}

class SearchNoData extends SearchState {}

class SearchError extends SearchState {}
