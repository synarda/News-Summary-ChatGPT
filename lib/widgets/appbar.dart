// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatgpt_news_brief/screens/bookmark_page.dart';
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    Key? key,
    required this.title,
    required this.leadingVisiblity,
  }) : super(key: key);
  final String title;
  final bool leadingVisiblity;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80.h,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () => Get.to(const BookmarkPage()),
          icon: const Icon(
            Icons.bookmark_outline_rounded,
            color: Colorss.textColor,
          ),
        ),
        SizedBox(width: 8.w),
        const Icon(
          Icons.search,
          color: Colorss.textColor,
        ),
        SizedBox(width: 16.w),
      ],
      leading: leadingVisiblity
          ? Builder(
              builder: (context) => IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colorss.textColor,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer()))
          : const SizedBox(),
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: Styles.bigTitleStyle,
      ),
      centerTitle: true,
    );
  }
}
