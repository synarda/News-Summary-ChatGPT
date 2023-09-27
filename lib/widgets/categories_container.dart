// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatgpt_news_brief/controllers/category_detail_controller.dart';
import 'package:chatgpt_news_brief/screens/categories_detail_page.dart';
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoriesContainerWidget extends StatelessWidget {
  const CategoriesContainerWidget({
    Key? key,
    required this.txt,
    required this.color,
    required this.index,
  }) : super(key: key);
  final String txt;
  final Color color;
  final int index;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryDetailController());

    return GestureDetector(
      onTap: () {
        Get.to(CategoriesDetailPage(category: txt));
        controller.getNewsWithCategory(txt);
      },
      child: Container(
        color: Colors.transparent,
        height: 100.h,
        width: Get.width,
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.all(16.sp),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80.w,
                height: 10.h,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r), color: color),
              ),
              SizedBox(height: 8.h),
              Text(txt, style: Styles.bigTextStyle),
            ],
          ),
          const Icon(Icons.arrow_forward_ios_rounded, color: Colorss.textColor)
        ]),
      ),
    )
        .animate()
        .move(begin: const Offset(500, 0), delay: (index * 100).ms, duration: 1500.ms, curve: Curves.easeInOutCubic);
  }
}
