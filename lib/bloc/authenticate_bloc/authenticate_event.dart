part of 'authenticate_bloc.dart';

abstract class AuthenticateEvent extends Equatable {
  const AuthenticateEvent();

  @override
  List<Object> get props => [];
}

class AuthenticateEventStated extends AuthenticateEvent {
  AuthenticateEventStated();
  @override
  List<Object> get props => [];
}
