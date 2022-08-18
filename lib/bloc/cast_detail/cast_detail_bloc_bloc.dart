import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bec_movie_app/model/cast_model.dart';

import '../../model/movie_model.dart';
import '../../service/data_service.dart';

part 'cast_detail_bloc_event.dart';
part 'cast_detail_bloc_state.dart';

class CastDetailBlocBloc
    extends Bloc<CastDetailBlocEvent, CastDetailBlocState> {
  CastDetailBlocBloc() : super(CastDetailBlocInitial()) {
    on<CastDetailEventStated>((event, emit) async {
      emit(CastDetailBlocLoading());
      try {
        final castDetail = await DataService().fetchCastDetail(event.id);
        print(event.id);
        final castCreditMovieList =
            await DataService().fetchCastCreditMovie(event.id);
        emit(CastDetailBlocLoaded(castDetail, castCreditMovieList));
      } catch (e) {
        emit(CastDetailBlocError());
      }
    });
  }
}
