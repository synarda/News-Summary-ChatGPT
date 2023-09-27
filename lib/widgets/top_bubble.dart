import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopBubbleWidget extends StatelessWidget {
  const TopBubbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.sp,
      width: 300.sp,
      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colorss.foreBackgroundColor),
    );
  }
}
