// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({
    Key? key,
    required this.summary,
  }) : super(key: key);
  final String summary;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0.r))),
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colorss.backGroundColor,
        content: Container(
          padding: EdgeInsets.all(16.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r), border: Border.all(width: 0.1, color: Colorss.textColor)),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text("Summary", style: Styles.mediumTextStyle),
            Divider(color: Colorss.textColor, indent: 32.w, endIndent: 32.w),
            Text(summary, style: Styles.smallTextStyle),
          ]),
        ));
  }
}
