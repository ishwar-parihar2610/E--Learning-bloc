import 'package:e_learning/pages/sign%20in/bloc/login_bloc.dart';
import 'package:e_learning/pages/sign%20in/bloc/login_events.dart';
import 'package:e_learning/pages/sign%20in/bloc/login_states.dart';
import 'package:e_learning/pages/sign%20in/login_controller.dart';
import 'package:e_learning/pages/sign%20in/widgets/sign_in_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        print("print hello world");
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  thiredpartyLogin(context),
                  Center(
                      child:
                          resuableText("Or use your email account to login")),
                  Container(
                    padding: EdgeInsets.only(left: 25.w),
                    margin: EdgeInsets.only(
                      top: 66.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        resuableText("Email"),
                        SizedBox(height: 5.h),
                        buildTextField(
                            "Enter your email address", "user", "email", (p0) {
                          print("po is >> $p0");

                          context.read<SignInBloc>().add(EmailEvent(email: p0));
                        }),
                        resuableText("Password"),
                        SizedBox(height: 5.h),
                        buildTextField("Password", "lock", "password", (p0) {
                          context
                              .read<SignInBloc>()
                              .add(PasswordEvents(password: p0));
                        }),
                        forgotPassword(),
                        buildLogInAndRegButton("Login", "login", () {
                          SignInController(context: context)
                              .handleSignIn("email");
                        }),
                        buildLogInAndRegButton("Register", "register", () {
                          Navigator.of(context).pushNamed("/register");
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
