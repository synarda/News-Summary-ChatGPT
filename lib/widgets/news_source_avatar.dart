// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsSourceAvatarWidget extends StatelessWidget {
  const NewsSourceAvatarWidget({
    Key? key,
    required this.size,
    required this.name,
  }) : super(key: key);

  final double size;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(100.r),
        child: Container(
          decoration: BoxDecoration(
            color: Colorss.theme01Color,
            borderRadius: BorderRadius.circular(100.r),
          ),
          height: size.sp,
          width: size.sp,
          child: Center(
            child: Text(
              name!.toString().substring(0, 1).toUpperCase(),
              style: TextStyle(color: Colorss.textColor, fontSize: size.sp / 2, fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
