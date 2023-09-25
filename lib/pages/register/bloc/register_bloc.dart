import 'package:e_learning/common/entities/global.dart';
import 'package:e_learning/common/widgets/flutter_toast.dart';
import 'package:e_learning/pages/register/bloc/register_controller.dart';
import 'package:e_learning/pages/register/bloc/register_events.dart';
import 'package:e_learning/pages/register/bloc/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBloc() : super(RegisterStates()) {
    on<RegisterDataEvents>(addUserData);
  }

  void addUserData(RegisterDataEvents events, Emitter<RegisterStates> emit) {
    emit(state.copyWith(
        confirmPassword: events.confirmPassword,
        emailAddress: events.emailAddress,
        password: events.password,
        userName: events.userName));

    if (checkValidation(emit)) {
      RegisterController.registerToFirebase(
          GlobalVariable.navigatorKey.currentState!.context);
    }
  }

  bool checkValidation(Emitter<RegisterStates> emit) {
    if (state.emailAddress.isEmpty) {
      toastInfo(msg: "Email Address is required");
      return false;
    } else if (state.password.isEmpty) {
      toastInfo(msg: "Password is required");
      return false;
    } else if (state.password != state.confirmPassword) {
      toastInfo(msg: "Confirm should be same");
      return false;
    } else {
      return true;
    }
  }
}
