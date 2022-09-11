import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/movie_detail_model.dart';
import '../../model/movie_model.dart';
import '../../service/data_service.dart';
import 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailInitial()) {
    on<MovieDetailEventStated>(
      (event, emit) async {
        emit(MovieDetailLoading());
        try {
          final movieDetail = await DataService().fetchDetailMovie(event.id);
          final recommendationDetail =
              await DataService().getRecommendationList(
            event.id,
          );
          emit(
            MovieDetailLoaded(
              movieDetail,
              recommendationDetail,
            ),
          );
        } catch (e) {
          emit(
            MovieDetailError(
              e.toString(),
            ),
          );
        }
      },
    );
  }
}
