import 'dart:ui';

import 'package:breathing_app/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import '../../../services/services.dart';
import '../../widgets/music_circular_effect.dart';

class MusicPlayerScreen extends StatefulWidget {
  final Music? music;
  const MusicPlayerScreen({super.key, required this.music});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  playAudioFile({required String url}) async {
    await audioPlayer.setUrl(url);
    audioPlayer.play();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    playAudioFile(url: widget.music != null ? widget.music!.file : "");
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
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: SizedBox(
                height: size.height,
                width: size.width,
              ),
            ),
          ),
          Positioned(
              top: 40.h,
              left: 16.w,
              right: 16.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 24.h,
                    width: 24.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          size: 12.r,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
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
                    child: CircleAvatar(
                      radius: 14.r,
                      backgroundColor: Colors.grey.shade300,
                      child: Icon(
                        CupertinoIcons.upload_circle,
                        size: 14.r,
                      ),
                    ),
                  )
                ],
              )),
          const Center(
            child: CircularPlayEffect(),
          ),
          Positioned(
              right: 24.w,
              left: 24.w,
              bottom: 40.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.music!.name.toString(),
                      style: GoogleFonts.baskervville(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold),
                      )),
                  Text("there is no description yet",
                      style: GoogleFonts.baskervville(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.normal),
                      )),
                  16.h.verticalSpace,
                  LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(16.r),
                    color: const Color(0xffF1BF98),
                    value: 0.8,
                    backgroundColor: Colors.white54,
                  ),
                  16.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          SnackBarService().showSnackbar(
                              message: "Will be implemented soon",
                              duration: 2,
                              title: "Not Implemented",
                              color: Colors.red);
                        },
                        child: SvgPicture.asset(
                          'assets/icons/all_music.svg',
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.18,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  SnackBarService().showSnackbar(
                                      message: "Will be implemented soon",
                                      duration: 2,
                                      title: "Not Implemented",
                                      color: Colors.red);
                                },
                                child: Image.asset(
                                    'assets/icons/previous_music.png')),
                            24.w.horizontalSpace,
                            GestureDetector(
                              onTap: () {
                                SnackBarService().showSnackbar(
                                    message: "Will be implemented soon",
                                    duration: 2,
                                    title: "Not Implemented",
                                    color: Colors.red);
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 24.r,
                                child: Center(
                                  child: IconButton(
                                      onPressed: () {
                                        SnackBarService().showSnackbar(
                                            message: "Will be implemented soon",
                                            duration: 2,
                                            title: "Not Implemented",
                                            color: Colors.red);
                                      },
                                      icon: const Icon(Icons.pause)),
                                ),
                              ),
                            ),
                            24.w.horizontalSpace,
                            Image.asset('assets/icons/next_music.png'),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
