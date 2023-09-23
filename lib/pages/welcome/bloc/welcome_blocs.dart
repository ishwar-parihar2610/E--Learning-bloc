import 'package:bloc/bloc.dart';
import 'package:e_learning/pages/welcome/bloc/welcome_events.dart';
import 'package:e_learning/pages/welcome/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvents, WelcomeState> {
  WelcomeBloc() : super(WelcomeState(page: 0)) {
    on<WelcomeEvents>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
