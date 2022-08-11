import 'package:bloc/bloc.dart';
import 'package:flutter_bec_movie_app/model/movie_cast.dart';
import 'package:meta/meta.dart';
import '../../service/data_service.dart';

import '../../model/movie_model.dart';

part 'movie_bloc_event.dart';
part 'movie_bloc_state.dart';

class MovieBlocBloc extends Bloc<MovieBlocEvent, MovieBlocState> {
  List<Movie> trendingList = [];
  List<Movie> popularList = [];
  List<MovieCast> peopleList = [];

  MovieBlocBloc() : super(MovieBlocInitial()) {
    on<MovieEventStarted>((event, emit) async {
      emit(MovieBlocLoading());
      trendingList = await DataService().fetchTrendingMovie();
      popularList = await DataService().fetchPopularMovie();
      peopleList = await DataService().fetchTrendingPeople();
      if (trendingList.isEmpty) {
        emit(MovieBlocError());
      } else {
        emit(MovieBlocLoaded(trendingList, popularList, peopleList));
      }
    });
  }
}
