import 'package:e_learning/common/widgets/flutter_toast.dart';
import 'package:e_learning/pages/register/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  static registerToFirebase(BuildContext context) async {
    String email = context.read<RegisterBloc>().state.emailAddress;
    String password = context.read<RegisterBloc>().state.password;
    String userName = context.read<RegisterBloc>().state.userName;
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(msg: "The email has been sent to your registered email.");
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        toastInfo(msg: "This email address is already use by another account");
      }
    }
  }
}
