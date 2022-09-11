import 'package:equatable/equatable.dart';

abstract class TVShowDetailEvent extends Equatable {
  const TVShowDetailEvent();
}

class TVShowDetailEventStated extends TVShowDetailEvent {
  final int id;
  TVShowDetailEventStated(this.id);
  @override
  List<Object> get props => [];
}
