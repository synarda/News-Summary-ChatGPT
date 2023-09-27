import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatgpt_news_brief/screens/bookmark_page.dart';
import 'package:chatgpt_news_brief/screens/categories.dart';
import 'package:chatgpt_news_brief/screens/home_page.dart';
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:chatgpt_news_brief/widgets/drawer_menu_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        width: Get.width,
        child: Stack(
          children: [
            Container(
                width: Get.width,
                height: Get.height,
                color: Colorss.backGroundColor,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 80.h),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100.r),
                            child: CachedNetworkImage(
                              height: 100.sp,
                              width: 100.sp,
                              fit: BoxFit.cover,
                              imageUrl: "https://mehmetardasayin.dev/images/aboutmetransparent.png",
                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                  const CupertinoActivityIndicator(color: Colorss.theme01Color),
                              errorWidget: (context, url, error) => Align(
                                  alignment: Alignment.centerLeft, child: Image.asset("assets/images/noPhoto.png")),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text("Mehmet Arda SAYIN", style: Styles.mediumTextStyle),
                          SizedBox(height: 4.h),
                          Text("Izmir, TURKEY", style: Styles.smallTextStyle.copyWith(fontSize: 12.sp)),
                          SizedBox(height: 16.h),
                          Container(
                            height: 120.h,
                            width: Get.width,
                            margin: EdgeInsets.symmetric(horizontal: 32.w),
                            padding: EdgeInsets.all(8.sp),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r), color: Colorss.foreBackgroundColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Get premium to access\nall exclusive content",
                                    textAlign: TextAlign.center, style: Styles.smallTextStyle),
                                InkWell(
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: Container(
                                    padding: EdgeInsets.all(10.sp),
                                    height: 40.h,
                                    width: 150.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.r), color: Colorss.theme01Color),
                                    child:
                                        Text("Subscribe Now", style: Styles.smallTextStyle.copyWith(fontSize: 12.sp)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32.h),
                      DrawerMenuButtonWidget(
                          index: 0,
                          function: () {
                            Get.back();

                            Get.off(const HomePage());
                          },
                          txt: "Home"),
                      DrawerMenuButtonWidget(
                          index: 1,
                          function: () {
                            Get.back();
                            Get.to(const CategoriesPage());
                          },
                          txt: "Categories"),
                      DrawerMenuButtonWidget(index: 2, function: () {}, txt: "History"),
                      DrawerMenuButtonWidget(
                          index: 3,
                          function: () {
                            Get.back();
                            Get.to(const BookmarkPage());
                          },
                          txt: "Bookmark"),
                      DrawerMenuButtonWidget(index: 4, function: () {}, txt: "Subscription"),
                      DrawerMenuButtonWidget(index: 5, function: () {}, txt: "Settings"),
                      DrawerMenuButtonWidget(index: 6, function: () {}, txt: "FAQ"),
                      DrawerMenuButtonWidget(index: 7, function: () {}, txt: "Logout"),
                      SizedBox(height: 30.h),
                    ],
                  ),
                )),
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
                    Icons.clear,
                    color: Colorss.textColor,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
