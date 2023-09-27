// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerMenuButtonWidget extends StatelessWidget {
  const DrawerMenuButtonWidget({
    Key? key,
    required this.function,
    required this.txt,
    required this.index,
  }) : super(key: key);
  final Function() function;
  final String txt;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 4.h),
        alignment: Alignment.center,
        child: Text(txt, style: Styles.bigTextStyle.copyWith(fontSize: 24.sp)),
      ),
    ).animate().move(
        begin: Offset(index % 2 == 0 ? 500 : -500, 0), delay: 0.ms, duration: 1500.ms, curve: Curves.easeInOutCubic);
  }
}
