import 'package:bloc/bloc.dart';
import 'package:flutter_bec_movie_app/bloc/tv_show_detail_bloc/tv_show_detail_event.dart';

import '../../data_layer/model/tv_show_detail_model.dart';
import '../../data_layer/model/tv_show_model.dart';
import '../../repository/service/data_service.dart';


part 'tv_show_detail_state.dart';

class TVShowDetailBloc extends Bloc<TVShowDetailEvent, TVShowDetailState> {
  TVShowDetailBloc() : super(TVShowDetailInitial()) {
    on<TVShowDetailEventStated>(
      (event, emit) async {
        emit(TVShowDetailLoading());
        try {
          final tvShowDetail = await DataService().fetchTVShowDetail(event.id);
          final recommendationDetail =
              await DataService().getRecommendationTVShowList(
            event.id,
          );
          emit(
            TVShowDetailLoaded(
              tvShowDetail,
              recommendationDetail,
            ),
          );
        } catch (e) {
          emit(
            TVShowDetailError(
              e.toString(),
            ),
          );
        }
      },
    );
  }
}
