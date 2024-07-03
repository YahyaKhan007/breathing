import 'package:breathing_app/ui/screens/homepage/widgets/homepage_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: homeAppBar(),
          ),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // 24.h.verticalSpace,
                // homeAppBar(),
                8.h.verticalSpace,
                searchField(),
                16.h.verticalSpace,
                homepageDataWidget(context),
                8.h.verticalSpace,
              ],
            ),
          ),
        ));
  }

  Widget searchField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextField(
        decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            prefixIcon: Image.asset('assets/icons/search.png'),
            hintText: 'Search here',
            hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey)),
      ),
    );
  }
}
