part of 'cast_detail_bloc_bloc.dart';

abstract class CastDetailBlocEvent extends Equatable {
  const CastDetailBlocEvent();
}

class CastDetailEventStated extends CastDetailBlocEvent {
  final int id;

  CastDetailEventStated(this.id);

  @override
  List<Object> get props => [];
}
