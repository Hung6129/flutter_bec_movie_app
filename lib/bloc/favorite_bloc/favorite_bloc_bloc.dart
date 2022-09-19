import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorite_bloc_event.dart';
part 'favorite_bloc_state.dart';

class FavoriteBlocBloc extends Bloc<FavoriteBlocEvent, FavoriteBlocState> {
  FavoriteBlocBloc() : super(FavoriteBlocInitial()) {
    on<FavoriteBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
