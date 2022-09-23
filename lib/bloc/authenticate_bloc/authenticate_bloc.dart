import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authenticate_event.dart';
part 'authenticate_state.dart';

class AuthenticateBloc extends Bloc<AuthenticateEvent, AuthenticateState> {
  AuthenticateBloc() : super(AuthenticateInitial()) {
    on<AuthenticateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
