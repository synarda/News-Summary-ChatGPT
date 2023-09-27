import 'package:chatgpt_news_brief/controllers/global_controller.dart';
import 'package:chatgpt_news_brief/screens/drawer_page.dart';
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:chatgpt_news_brief/widgets/appbar.dart';
import 'package:chatgpt_news_brief/widgets/news_type_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerGlobal = Get.find<GlobalController>();
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: const DrawerPage(),
      backgroundColor: Colorss.backGroundColor,
      appBar: PreferredSize(
          preferredSize: Size(Get.width, 80.h), child: const AppbarWidget(leadingVisiblity: true, title: "Bookmark")),
      body: controllerGlobal.bookMarkList.isEmpty
          ? Center(
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset("assets/jsons/blank.json", height: 100.sp, width: 100.sp, fit: BoxFit.cover),
                SizedBox(height: 8.h),
                Text(
                  "No bookmark",
                  style: Styles.smallTextStyle.copyWith(color: Colorss.softTextColor, fontSize: 12.sp),
                )
              ],
            ))
          : ListView.builder(
              itemCount: controllerGlobal.bookMarkList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                      color: Colorss.backGroundColor,
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 130.h,
                        width: 60.w,
                        margin: EdgeInsets.all(16.sp),
                        decoration: BoxDecoration(
                            color: const Color(0xffFF0066).withOpacity(0.5), borderRadius: BorderRadius.circular(20.r)),
                        child: const Icon(Icons.delete_outlined, color: Color(0xffFF0066)),
                      )),
                  key: Key(controllerGlobal.bookMarkList[index].url.toString()),
                  onDismissed: (direction) {
                    controllerGlobal.bookMarkList.removeAt(index);
                  },
                  child: NewsTypeOneWidget(news: controllerGlobal.bookMarkList[index]),
                );
              },
            ),
    );
  }
}
