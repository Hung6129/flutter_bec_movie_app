import 'package:bloc/bloc.dart';
import 'package:flutter_bec_movie_app/model/movie_cast.dart';
import 'package:meta/meta.dart';
import '../../service/data_service.dart';

import '../../model/movie_model.dart';

part 'movie_bloc_event.dart';
part 'movie_bloc_state.dart';

class MovieBlocBloc extends Bloc<MovieBlocEvent, MovieBlocState> {
  List<Movie> nowPlayingList = [];
  List<Movie> popularList = [];
  List<MovieCast> peopleList = [];

  MovieBlocBloc() : super(MovieBlocInitial()) {
    on<MovieEventStarted>((event, emit) async {
      emit(MovieBlocLoading());
      popularList = await DataService().fetchPopularMovie();
      nowPlayingList = await DataService().fetchNowPlayingMovie();
      peopleList = await DataService().fetchPopularCast();
      if (popularList.isEmpty || popularList.isEmpty || peopleList.isEmpty) {
        emit(MovieBlocError());
      } else {
        emit(MovieBlocLoaded(nowPlayingList, popularList, peopleList));
      }
    });
  }
}
