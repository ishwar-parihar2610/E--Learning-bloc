import 'package:e_learning/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar({String title="Log in"}) => AppBar(
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: AppColors.primarySecondaryBackground,
            height: 1.0,
          )),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal),
      ),
    );

Widget thiredpartyLogin(BuildContext context) => Center(
      child: Container(
        margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _resuseableIcons("google"),
            _resuseableIcons("apple"),
            _resuseableIcons("facebook"),
          ],
        ),
      ),
    );

Widget _resuseableIcons(String path) => GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 40.w,
        width: 40.w,
        child: Image.asset("assets/icons/$path.png"),
      ),
    );

Widget resuableText(String text) => Container(
      margin: EdgeInsets.only(bottom: 5.h),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.grey.withOpacity(0.5),
            fontWeight: FontWeight.normal,
            fontSize: 14.sp),
      ),
    );

Widget buildTextField(String text, String iconName, String textType,
        Function(String) onChanged) =>
    Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(bottom: 20.h, right: 30.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
          border: Border.all(color: Colors.black)),
      child: Row(
        children: [
          Container(
            width: 16.w,
            margin: EdgeInsets.only(left: 17.w),
            height: 16.w,
            child: Image.asset("assets/icons/$iconName.png"),
          ),
          SizedBox(
            width: 270.w,
            height: 50.h,
            child: TextField(
             onChanged: (value) {
               onChanged(value);
             },
              maxLines: 1,
              // maxLines: null,
              keyboardType: TextInputType.text,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp),
              autocorrect: false,
              obscureText: textType == "password" ? true : false,
              decoration: InputDecoration(
                  hintText: text,
                  hintStyle: const TextStyle(
                      color: AppColors.primarySecondaryElementText),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent))),
            ),
          )
        ],
      ),
    );

Widget forgotPassword() => Container(
      margin: EdgeInsets.only(left: 3.w),
      width: 260.w,
      height: 44.h,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "Forgot password",
          style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.underline,
              fontSize: 12.sp,
              decorationColor: AppColors.primaryText),
        ),
      ),
    );

Widget buildLogInAndRegButton(String buttonName, String buttonType, Function onTap) =>
    GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 325.w,
        height: 50.h,
        margin: EdgeInsets.only(
            right: 25.w, top: buttonType == "login" ? 40.h : 10.h),
        decoration: BoxDecoration(
            border: Border.all(
                color: buttonType == "login"
                    ? Colors.transparent
                    : AppColors.primaryFourElementText),
            color: buttonType == "login"
                ? AppColors.primaryElement
                : AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.w),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                  color: Colors.grey.withOpacity(0.1))
            ]),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: buttonType == "login"
                  ? AppColors.primaryBackground
                  : AppColors.primaryText,
            ),
          ),
        ),
      ),
    );
