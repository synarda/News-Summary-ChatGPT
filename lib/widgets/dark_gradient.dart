// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DarkGradientWidget extends StatelessWidget {
  const DarkGradientWidget({
    Key? key,
    required this.height,
    required this.width,
    this.radius = 20,
  }) : super(key: key);
  final double height;
  final double width;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius.r),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colorss.backGroundColor,
            ],
          )),
    );
  }
}
