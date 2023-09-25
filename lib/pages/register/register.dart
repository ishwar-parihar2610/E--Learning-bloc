import 'package:e_learning/pages/register/bloc/register_bloc.dart';
import 'package:e_learning/pages/register/bloc/register_events.dart';
import 'package:e_learning/pages/register/bloc/register_states.dart';
import 'package:e_learning/pages/sign%20in/widgets/sign_in_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String userEmail = "";
  String userName = "";
  String password = "";
  String confirmPassword = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(
      builder: (context, state) {
        print("print hello world");
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(title: "Sign up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Center(
                      child: resuableText(
                          "Enter your details below & free sign up")),
                  Container(
                    padding: EdgeInsets.only(left: 25.w),
                    margin: EdgeInsets.only(
                      top: 10.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        resuableText("User name"),
                        SizedBox(height: 5.h),
                        buildTextField(
                            "Enter your your user name", "user", "email", (p0) {
                          userName = p0;
                        }),
                        resuableText("Email"),
                        SizedBox(height: 5.h),
                        buildTextField(
                            "Enter your email address", "user", "email", (p0) {
                          userEmail = p0;
                        }),
                        resuableText("Password"),
                        SizedBox(height: 5.h),
                        buildTextField(
                            "Enter your Password", "lock", "password", (p0) {
                          password = p0;
                        }),
                        SizedBox(height: 5.h),
                        resuableText("Confirm Password"),
                        buildTextField(
                            "Enter your confirm password", "lock", "password",
                            (p0) {
                          confirmPassword = p0;
                        }),
                        SizedBox(height: 5.h),
                        resuableText(
                            "By Creating an account you have to agree with our them & condition"),
                        buildLogInAndRegButton("Sign up", "login", () {
                          context.read<RegisterBloc>().add(RegisterDataEvents(
                              userName: userName,
                              emailAddress: userEmail,
                              password: password,
                              confirmPassword: confirmPassword));

                          // SignInController(context: context)
                          //     .handleSignIn("email");
                        }),
                        SizedBox(height: 5.h)
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
