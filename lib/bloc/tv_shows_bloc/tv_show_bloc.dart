import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bec_movie_app/model/tv_show_model.dart';

import '../../service/data_service.dart';

part 'tv_show_event.dart';
part 'tv_show_state.dart';

class TvShowBloc extends Bloc<TvShowEvent, TvShowState> {
  List<TVShowModel> onAirList = [];
  List<TVShowModel> topRatedList = [];
  TvShowBloc() : super(TvShowInitial()) {
    on<TVShowEventStarted>(
      (event, emit) async {
        emit(TvShowLoading());
        // popularList = await DataService().fetchPopularMovie();
        topRatedList = await DataService().fetchTopRatedTVShow();
        onAirList = await DataService().fetchAirPlayingTVShow();
        if (topRatedList.isEmpty || onAirList.isEmpty) {
          emit(TvShowError());
        } else {
          emit(TvShowLoaded(onAirList, topRatedList
              // popularList, peopleList
              ));
        }
      },
    );
  }
}
