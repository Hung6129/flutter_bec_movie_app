part of 'cast_detail_bloc_bloc.dart';

abstract class CastDetailBlocState extends Equatable {
  const CastDetailBlocState();

  @override
  List<Object> get props => [];
}

class CastDetailBlocInitial extends CastDetailBlocState {}

class CastDetailBlocLoading extends CastDetailBlocState {}

class CastDetailBlocLoaded extends CastDetailBlocState {
  final CastModel castModel;

  CastDetailBlocLoaded(this.castModel);

  @override
  List<Object> get props => [castModel];
}

class CastDetailBlocError extends CastDetailBlocState {}
