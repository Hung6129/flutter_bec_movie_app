import 'package:bloc/bloc.dart';
import 'package:flutter_bec_movie_app/bloc/tv_show_detail_bloc/tv_show_detail_event.dart';
import 'package:meta/meta.dart';

import '../../model/movie_model.dart';
import '../../model/tv_show_detail_model.dart';
import '../../service/data_service.dart';

part 'tv_show_detail_state.dart';

class MovieDetailBloc extends Bloc<TVShowDetailEvent, TVShowDetailState> {
  MovieDetailBloc() : super(TVShowDetailInitial()) {
    on<TVShowDetailEventStated>(
      (event, emit) async {
        emit(TVShowDetailLoading());
        try {
          final tvShowDetail = await DataService().fetchDetailMovie(event.id);
          final recommendationDetail =
              await DataService().getRecommendationList(
            event.id,
          );
          emit(
            TVShowDetailLoaded(
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
