part of 'authenticate_bloc.dart';

abstract class AuthenticateState extends Equatable {
  const AuthenticateState();

  @override
  List<Object> get props => [];
}

class AuthenticateInitial extends AuthenticateState {}

class AuthenticateLoading extends AuthenticateState {}

class AuthenticateSuccess extends AuthenticateState {}

class AuthenticateFail extends AuthenticateState {}

class AuthenticateError extends AuthenticateState {}
