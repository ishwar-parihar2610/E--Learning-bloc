// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_learning/pages/sign%20in/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;

  SignInController({
    required this.context,
  });

  void handleSignIn(String type) {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          /// warning message
        }
        if (password.isEmpty) {
          /// warning message for password
        }
      }
    } catch (e) {}
  }
}
