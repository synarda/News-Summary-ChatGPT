// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatgpt_news_brief/screens/home_page.dart';
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginContainerWidget extends StatelessWidget {
  const LoginContainerWidget({
    Key? key,
    required this.imgName,
    required this.txt,
  }) : super(key: key);
  final String imgName;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(const HomePage()),
      child: Container(
        height: 70.h,
        width: Get.width,
        decoration: BoxDecoration(color: Colorss.foreBackgroundColor, borderRadius: BorderRadius.circular(20.r)),
        margin: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(width: 16.w),
          Container(
            height: 50.sp,
            width: 50.sp,
            decoration: BoxDecoration(
              color: Colorss.backGroundColor,
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Image.asset("assets/images/$imgName.png"),
          ),
          const Spacer(),
          Text("Login with $txt", style: Styles.mediumTextStyle),
          const Spacer(),
        ]),
      ),
    );
  }
}
