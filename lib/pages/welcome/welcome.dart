import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_learning/common/values/colors.dart';
import 'package:e_learning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:e_learning/pages/welcome/bloc/welcome_events.dart';
import 'package:e_learning/pages/welcome/bloc/welcome_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreenPage extends StatefulWidget {
  const WelcomeScreenPage({super.key});

  @override
  State<WelcomeScreenPage> createState() => _WelcomeScreenPageState();
}

class _WelcomeScreenPageState extends State<WelcomeScreenPage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            print("call again");
            return Container(
              margin: EdgeInsets.only(
                top: 34.h,
              ),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (value) {
                      state.page = value;
                      context.read<WelcomeBloc>().add(WelcomeEvents());
                    },
                    children: [
                      _page(
                          1,
                          context,
                          "next",
                          "First See Learning",
                          "Forgot about a for of paper all knowledge in one learning!",
                          "assets/images/reading.png"),
                      _page(
                          2,
                          context,
                          "next",
                          "Connect With Everyone",
                          "Always keep in touch with your tutor & friend. Let's get connected",
                          "assets/images/boy.png"),
                      _page(
                          3,
                          context,
                          "Get Started",
                          "Always Fascinated Learning",
                          "Anywhere , anytime. The time is at your discreation so study whenever you want. ",
                          "assets/images/man.png"),
                    ],
                  ),
                  Positioned(
                      bottom: 80.h,
                      child: DotsIndicator(
                        dotsCount: 3,
                        position: state.page,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                            activeColor: Colors.blue,
                            activeSize: const Size(18.0, 8.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            color: Colors.grey,
                            size: const Size.square(8.0)),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext ctx, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
            width: 345.h,
            height: 345.w,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            )),
        Center(
          child: SizedBox(
            child: Text(
              title,
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SizedBox(
              child: Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.decelerate);
            } else {
              Navigator.of(context).pushNamed("/signIn");
            }
          },
          child: Container(
            width: 325.w,
            height: 50.h,
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 30.w),
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: const Offset(0, 10)),
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        )
      ],
    );
  }
}
