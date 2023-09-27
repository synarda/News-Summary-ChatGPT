import 'package:chatgpt_news_brief/screens/login_page.dart';
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backGroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 48.h),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Read news\nanywhere,\nanytime",
                style: Styles.bigTitleStyle.copyWith(fontSize: 45.sp),
              ),
              SizedBox(height: 24.h),
              Text(
                "Lorem ipsum dolor sit amet, consec tetur adipiscing elit. Donec rutrum volutpat massa vitae mattis.",
                style: Styles.mediumTextStyle.copyWith(color: Colorss.softTextColor),
              ),
            ],
          ),
          SizedBox(height: 48.h),
          InkWell(
            borderRadius: BorderRadius.circular(20.r),
            onTap: () => Get.to(const LoginPage()),
            child: Container(
              height: 80.h,
              width: (Get.width - 64).w,
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r), color: Colorss.theme01Color),
              child: Text("Get Started", style: Styles.mediumTextStyle),
            ),
          )
        ]),
      ),
    );
  }
}
