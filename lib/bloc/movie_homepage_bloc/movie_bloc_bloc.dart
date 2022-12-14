import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data_layer/model/movie_cast.dart';
import '../../data_layer/model/movie_model.dart';
import '../../repository/service/data_service.dart';

part 'movie_bloc_event.dart';
part 'movie_bloc_state.dart';

class MovieBlocBloc extends Bloc<MovieBlocEvent, MovieBlocState> {
  List<Movie> nowPlayingList = [];
  List<Movie> topRatedList = [];
  // List<Movie> upCommingList = [];
  List<MovieCast> peopleList = [];

  MovieBlocBloc() : super(MovieBlocInitial()) {
    on<MovieEventStarted>(
      (event, emit) async {
        emit(MovieBlocLoading());
        // popularList = await DataService().fetchPopularMovie();
        topRatedList = await DataService().fetchTopRatedMovie();
        nowPlayingList = await DataService().fetchNowPlayingMovie();
        peopleList = await DataService().fetchPopularCast();
        if (nowPlayingList.isEmpty || peopleList.isEmpty) {
          emit(MovieBlocError());
        } else {
          emit(MovieBlocLoaded(nowPlayingList, peopleList, topRatedList
              // popularList, peopleList
              ));
        }
      },
    );
  }
}
