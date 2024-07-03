import 'dart:ui';

import 'package:breathing_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../blocs/bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background_image.jpg"),
                  fit: BoxFit.fitHeight),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: SizedBox(
                height: size.height,
                width: size.width,
              ),
            ),
          ),
          Positioned(
              child: Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.white,
                  Colors.white70,
                  Colors.white24,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent
                ])),
          )),
          Positioned(
              bottom: size.height * 0.14,
              child: SizedBox(
                height: size.height * 0.12,
                width: size.width,
                child: BlocBuilder<OnboardingBloc, OnboardingState>(
                  builder: (context, state) {
                    return PageView.builder(
                        controller: state.pageController,
                        onPageChanged: (index) {
                          context
                              .read<OnboardingBloc>()
                              .add(ChangePageEvent(index: index));
                        },
                        itemCount: 3,
                        itemBuilder: ((context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Welcome to Breathin",
                                style: GoogleFonts.bebasNeue(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w400)),
                              ),
                              Text(
                                "Take care of your hives through Breathin",
                                style: GoogleFonts.bebasNeue(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ],
                          );
                        }));
                  },
                ),
              )),
          Positioned(
              bottom: size.height * 0.14,
              left: 0,
              right: 0,
              // left: MediaQuery.of(context).size.width /,
              child: BlocBuilder<OnboardingBloc, OnboardingState>(
                builder: (context, state) {
                  return Align(
                    alignment: Alignment.center,
                    child: SmoothPageIndicator(
                      controller: state.pageController,
                      onDotClicked: (int index) {
                        context
                            .read<OnboardingBloc>()
                            .add(ChangePageEvent(index: index));
                      },
                      count: 3,
                      effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.black, dotHeight: 10),
                    ),
                  );
                },
              )),
          Positioned(
            left: 0,
            right: 0,
            bottom: size.height * 0.05,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  GetStorage().write('isFirstTime', false);
                  Navigator.pushReplacementNamed(
                      context, RouterHelper.register);
                },
                child: Container(
                  height: 40.h,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r),
                    color: const Color(0xffF1BF98),
                  ),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
