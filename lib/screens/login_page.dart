import 'package:chatgpt_news_brief/screens/register_page.dart';
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:chatgpt_news_brief/widgets/login_container.dart';
import 'package:chatgpt_news_brief/widgets/top_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colorss.backGroundColor,
        body: Stack(
          children: [
            Positioned(
              left: 32.w,
              top: 56.h,
              child: InkWell(
                borderRadius: BorderRadius.circular(100.r),
                onTap: Get.back,
                child: Container(
                  height: 60.sp,
                  width: 60.sp,
                  decoration: BoxDecoration(color: Colorss.theme01Color, borderRadius: BorderRadius.circular(100.r)),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colorss.textColor,
                  ),
                ),
              ),
            ),
            Positioned(right: -48.sp, top: -48.sp, child: const TopBubbleWidget()),
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 80.h),
                      Text(
                        "Welcome to Zints! Please Login",
                        style: Styles.bigTitleStyle.copyWith(fontSize: 30.sp),
                      ),
                      SizedBox(height: 32.h),
                      const LoginContainerWidget(imgName: "google-seeklogo.com", txt: "Google"),
                      const LoginContainerWidget(imgName: "facebook-seeklogo.com", txt: "Facebook"),
                      const LoginContainerWidget(imgName: "apple-seeklogo.com", txt: "Apple"),
                      SizedBox(height: 32.h),
                      GestureDetector(
                        onTap: () => Get.to(const RegisterPage()),
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Don't have an account? ",
                                  style: Styles.smallTextStyle.copyWith(fontSize: 14.sp, color: Colorss.softTextColor)),
                              TextSpan(
                                  text: "SignUp",
                                  style: Styles.smallTextStyle
                                      .copyWith(color: Colorss.textColor, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}
