part of 'favorite_bloc_bloc.dart';

abstract class FavoriteBlocState extends Equatable {
  const FavoriteBlocState();
  
  @override
  List<Object> get props => [];
}

class FavoriteBlocInitial extends FavoriteBlocState {}
