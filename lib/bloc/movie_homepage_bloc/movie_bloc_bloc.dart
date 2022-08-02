import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../service/data_service.dart';

import '../../model/movie_model.dart';

part 'movie_bloc_event.dart';
part 'movie_bloc_state.dart';

class MovieBlocBloc extends Bloc<MovieBlocEvent, MovieBlocState> {
  List<Movie> trendingList = [];
  List<Movie> popularList = [];

  MovieBlocBloc() : super(MovieBlocInitial()) {
    on<MovieEventStarted>((event, emit) async {
      emit(MovieBlocLoading());
      trendingList = await DataService().fetchTrendingMovie();
      popularList = await DataService().fetchPopularMovie();
      if (trendingList.isEmpty) {
        emit(MovieBlocError());
      } else {
        emit(MovieBlocLoaded(
          trendingList,
          popularList,
        ));
      }
    });
  }
}
