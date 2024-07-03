import 'package:breathing_app/blocs/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../widgets/widgets.dart';

Widget registrationDataWidget(
    {required BuildContext context,
    required Size size,
    required TextEditingController emailController,
    required TextEditingController passwordController}) {
  return SizedBox(
    height: size.height,
    width: size.width,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            80.h.verticalSpace,
            Text(
              "Welcome to Breathin",
              style: GoogleFonts.bebasNeue(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400)),
            ),
            Text("Please enter your details to continue",
                style: TextStyle(
                    letterSpacing: -1,
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300)),
            16.h.verticalSpace,
            fieldWidget(
                hint: 'example@gmail.com',
                label: 'Email',
                controller: emailController),
            16.h.verticalSpace,
            fieldWidget(
                hint: 'password',
                label: 'password'.capitalizeFirst!,
                controller: passwordController),
            8.h.verticalSpace,
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            16.h.verticalSpace,
            acceptTermCondition(),
            16.h.verticalSpace,
            GestureDetector(
              onTap: () {
                context.read<AuthenticationBloc>().add(EmailSignupEvent(
                    email: emailController.text,
                    password: passwordController.text));
              },
              child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return Container(
                    height: 40.h,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: const Color(0xffF1BF98)),
                    child: Center(
                      child: state.emailLoading
                          ? LoadingWidget.showInkDrop(
                              color: Colors.black, context: context, size: 24.r)
                          : Text(
                              "Continue",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                    ),
                  );
                },
              ),
            ),
            16.h.verticalSpace,
            orWidget(),
            16.h.verticalSpace,
            loginOption(
                size: size,
                label: 'Sign in with Google',
                onTap: () {},
                icon: EvaIcons.google),
            8.h.verticalSpace,
            loginOption(
                size: size,
                label: 'Sign in with Apple',
                onTap: () {},
                icon: AntDesign.apple_fill)
          ],
        ),
      ),
    ),
  );
}

Widget loginOption(
    {required Size size,
    required IconData icon,
    required String label,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 40.h,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: const Color(0xffF1BF98),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon),
          8.w.horizontalSpace,
          Text(
            label,
            style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}

Widget orWidget() {
  return Row(children: [
    Expanded(
      child: Container(
        height: 1,
        color: Colors.white54,
      ),
    ),
    16.w.horizontalSpace,
    Text(
      "or",
      style: TextStyle(
          fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.white54),
    ),
    16.w.horizontalSpace,
    Expanded(
      child: Container(
        height: 1,
        color: Colors.white54,
      ),
    ),
  ]);
}

Widget acceptTermCondition() {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: Radio(
      onChanged: (val) {},
      value: true,
      groupValue: true,
    ),
    dense: true,
    horizontalTitleGap: 8.w,
    title: Text(
      "I accept the terms and privacy policy",
      style: TextStyle(
          color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w400),
    ),
  );
}

Widget fieldWidget(
    {required TextEditingController controller,
    required String hint,
    required String label}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        label,
        style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
            fontWeight: FontWeight.normal),
      ),
      6.h.verticalSpace,
      Container(
        height: 40.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.white),
            color: Colors.white.withOpacity(0.5)),
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: TextFormField(
            controller: controller,
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    ],
  );
}
