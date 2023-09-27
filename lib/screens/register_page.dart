import 'package:chatgpt_news_brief/controllers/register_controller.dart';
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:chatgpt_news_brief/widgets/textfield.dart';
import 'package:chatgpt_news_brief/widgets/top_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
          backgroundColor: Colorss.backGroundColor,
          body: Stack(
            children: [
              Positioned(right: -48.sp, top: -48.sp, child: const TopBubbleWidget()),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: ListView(shrinkWrap: true, physics: const BouncingScrollPhysics(), children: [
                    Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: Styles.bigTitleStyle.copyWith(fontSize: 30.sp),
                    ),
                    SizedBox(height: 32.h),
                    Column(
                      children: [
                        TextfieldWidget(
                          hintText: "Full Name",
                          radius: 20.r,
                        ),
                        TextfieldWidget(
                          hintText: "Your Email",
                          radius: 20.r,
                        ),
                        TextfieldWidget(
                          hintText: "Your Password",
                          radius: 20.r,
                        ),
                        TextfieldWidget(
                          hintText: "Confirm Password",
                          radius: 20.r,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => SizedBox(
                            height: 40.h,
                            width: 60.w,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Switch(
                                value: controller.isSwitch.value,
                                onChanged: (_) {
                                  controller.isSwitch.toggle();
                                },
                                inactiveThumbColor: Colorss.backGroundColor,
                                thumbColor: MaterialStateProperty.all<Color>(Colorss.foreBackgroundColor),
                                activeTrackColor: Colorss.theme01Color,
                                activeColor: Colorss.backGroundColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text("Subscribe to our newsletter",
                            style: Styles.smallTextStyle.copyWith(color: Colorss.softTextColor)),
                      ],
                    ),
                    SizedBox(height: 48.h),
                    InkWell(
                      borderRadius: BorderRadius.circular(20.r),
                      onTap: controller.futureDelay,
                      child: Container(
                        padding: EdgeInsets.all(8.sp),
                        height: 80.sp,
                        width: Get.width,
                        alignment: Alignment.center,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(20.r), color: Colorss.theme01Color),
                        child: Text("Create Account", style: Styles.mediumTextStyle),
                      ),
                    )
                  ]),
                ),
              ),
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
            ],
          )),
    );
  }
}
