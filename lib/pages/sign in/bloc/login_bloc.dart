import 'package:e_learning/pages/sign%20in/bloc/login_events.dart';
import 'package:e_learning/pages/sign%20in/bloc/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvents, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailEvent>((event, emit) => _emailEvent,);

    on<PasswordEvents>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvents event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
