import 'package:breathing_app/services/getx_controllers_service/current_user_controller_service/current_user_controller_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../services/services.dart';
import '../../screens.dart';

Widget homepageDataWidget(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  final userController = Get.find<UserController>();
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Favorites",
                style: GoogleFonts.baskervville(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  SnackBarService().showSnackbar(
                      message: "Will be implemented soon",
                      duration: 2,
                      title: "Not Implemented",
                      color: Colors.red);
                },
                child: Text(
                  "See All",
                  style: GoogleFonts.baskervville(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        8.h.verticalSpace,
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: favouriteSongs(size: size, userController: userController),
        ),
        8.h.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Featured",
                style: GoogleFonts.baskervville(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  SnackBarService().showSnackbar(
                      message: "Will be implemented soon",
                      duration: 2,
                      title: "Not Implemented",
                      color: Colors.red);
                },
                child: Text(
                  "See All",
                  style: GoogleFonts.baskervville(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        8.h.verticalSpace,
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: favouriteSongs(size: size, userController: userController),
        ),
        8.h.verticalSpace,
        verticalBuilder(size: size, userController: userController),
      ],
    ),
  );
}

Widget verticalBuilder(
    {required Size size, required UserController userController}) {
  return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: userController.musicList.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(() =>
                MusicPlayerScreen(music: userController.musicList[index]));
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 16.h, right: 16.w, left: 16.w),
            height: size.height * 0.1,
            width: size.width * 0.9,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      userController.musicList[index].picture,
                    ),
                    fit: BoxFit.cover),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16.r)),
            child: Padding(
              padding: const EdgeInsets.only(left: 24).w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userController.musicList[index].name,
                      style: GoogleFonts.baskervville(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      )),
                  FittedBox(
                    child: Row(
                      children: [
                        Text('10 min',
                            style: GoogleFonts.baskervville(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300),
                            )),
                        Text('. Sleep',
                            style: GoogleFonts.baskervville(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}

Widget favouriteSongs(
    {required Size size, required UserController userController}) {
  return SizedBox(
    height: size.height * 0.16,
    width: size.width,
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: userController.musicList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() =>
                  MusicPlayerScreen(music: userController.musicList[index]));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8.w),
                  height: size.height * 0.1,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            userController.musicList[index].picture,
                          ),
                          fit: BoxFit.cover),
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16.r)),
                ),
                Text(userController.musicList[index].name,
                    style: GoogleFonts.baskervville(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    )),
                FittedBox(
                  child: Row(
                    children: [
                      Text('10 min',
                          style: GoogleFonts.baskervville(
                            textStyle: TextStyle(
                                color: Colors.black45,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300),
                          )),
                      Text('. Sleep',
                          style: GoogleFonts.baskervville(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal),
                          )),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
  );
}
