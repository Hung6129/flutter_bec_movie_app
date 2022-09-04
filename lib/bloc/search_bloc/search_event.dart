part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class OnQueryChanged extends SearchEvent {
  final String query;

  const OnQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}
