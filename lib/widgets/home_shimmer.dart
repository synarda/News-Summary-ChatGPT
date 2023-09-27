import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:chatgpt_news_brief/widgets/dark_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeShimmerWidget extends StatelessWidget {
  const HomeShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colorss.backGroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: Colorss.foreBackgroundColor,
                    height: 280.h,
                    width: Get.width,
                  ).animate(
                    onComplete: (controller) {
                      controller.forward(from: 0.0);
                    },
                  ).shimmer(duration: 750.ms, delay: 10.ms, color: Colorss.textColor.withOpacity(0.2)),
                  DarkGradientWidget(
                    height: 290.h,
                    width: Get.width,
                    radius: 0,
                  )
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 130.h,
                      width: Get.width,
                      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colorss.foreBackgroundColor.withOpacity(0.5)),
                      child: Row(children: [
                        Container(
                          height: 80.sp,
                          width: 80.sp,
                          decoration: BoxDecoration(
                              color: Colorss.foreBackgroundColor, borderRadius: BorderRadius.circular(20.r)),
                        ).animate(
                          onComplete: (controller) {
                            controller.forward(from: 0.0);
                          },
                        ).shimmer(duration: 750.ms, delay: 10.ms, color: Colorss.textColor.withOpacity(0.2)),
                        SizedBox(width: 16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 100.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                  color: Colorss.foreBackgroundColor, borderRadius: BorderRadius.circular(20.r)),
                            ).animate(
                              onComplete: (controller) {
                                controller.forward(from: 0.0);
                              },
                            ).shimmer(duration: 750.ms, delay: 10.ms, color: Colorss.textColor.withOpacity(0.2)),
                            Container(
                              width: 250.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                  color: Colorss.foreBackgroundColor, borderRadius: BorderRadius.circular(20.r)),
                            ).animate(
                              onComplete: (controller) {
                                controller.forward(from: 0.0);
                              },
                            ).shimmer(duration: 750.ms, delay: 10.ms, color: Colorss.textColor.withOpacity(0.2)),
                            Row(
                              children: [
                                Container(
                                  width: 100.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      color: Colorss.foreBackgroundColor, borderRadius: BorderRadius.circular(20.r)),
                                ).animate(
                                  onComplete: (controller) {
                                    controller.forward(from: 0.0);
                                  },
                                ).shimmer(duration: 750.ms, delay: 10.ms, color: Colorss.textColor.withOpacity(0.2)),
                                SizedBox(width: 16.w),
                                Container(
                                  width: 100.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      color: Colorss.foreBackgroundColor, borderRadius: BorderRadius.circular(20.r)),
                                ).animate(
                                  onComplete: (controller) {
                                    controller.forward(from: 0.0);
                                  },
                                ).shimmer(duration: 750.ms, delay: 10.ms, color: Colorss.textColor.withOpacity(0.2)),
                              ],
                            )
                          ],
                        )
                      ]),
                    );
                  }),
            ],
          ),
        ));
  }
}
