import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data_layer/model/movie_model.dart';


part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) {
    });
  }
}
