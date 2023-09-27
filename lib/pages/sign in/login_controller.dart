import 'package:e_learning/common/widgets/flutter_toast.dart';
import 'package:e_learning/pages/sign%20in/bloc/login_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;

  SignInController({
    required this.context,
  });

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        print("emailAddress is >>$emailAddress");
        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to fill email address");
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill password");
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          var user = credential.user;
          if (user != null) {
            print("email required ${user.emailVerified}");
            if (!user.emailVerified) {
              toastInfo(msg: "Your email is not verfied");
            } else {
              Navigator.pushNamed(context, "/application");
            }
          } else {
            toastInfo(msg: "Currently you are not a user of this app");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "INVALID_LOGIN_CREDENTIALS") {
            toastInfo(msg: "User Credentials is wrong");
          }
        }
      }
    } catch (e) {}
  }
}
