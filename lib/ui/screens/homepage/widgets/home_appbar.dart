import 'package:breathing_app/services/services.dart';
import 'package:breathing_app/ui/utils/file_picker_utils/file_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget homeAppBar() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Row(
      children: [
        Expanded(
          child: Text(
            "Breathin",
            style: GoogleFonts.baskervville(
                textStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        GestureDetector(
          onTap: () {
            FilePickerUtils().pickAndUploadFile();
          },
          child: Stack(
            children: [
              CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.grey.shade300,
                child: Center(
                  child: Icon(Icons.add, color: Colors.black45, size: 18.r),
                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 4.r,
                    backgroundColor: Colors.red,
                  ))
            ],
          ),
        ),
        8.w.horizontalSpace,
        GestureDetector(
          onTap: () {
            SnackBarService().showSnackbar(
                message: "Will be implemented soon",
                duration: 2,
                title: "Not Implemented",
                color: Colors.red);
          },
          child: Stack(
            children: [
              CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.grey.shade300,
                child: Center(
                  child: Image.asset('assets/icons/message.png'),
                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 4.r,
                    backgroundColor: Colors.red,
                  ))
            ],
          ),
        ),
        8.w.horizontalSpace,
        GestureDetector(
          onTap: () {
            SnackBarService().showSnackbar(
                message: "Will be implemented soon",
                duration: 2,
                title: "Not Implemented",
                color: Colors.red);
          },
          child: Stack(
            children: [
              CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.grey.shade300,
                child: Center(
                  child: Image.asset('assets/icons/notification.png'),
                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 4.r,
                    backgroundColor: Colors.red,
                  ))
            ],
          ),
        ),
      ],
    ),
  );
}
