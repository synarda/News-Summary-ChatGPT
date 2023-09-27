// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsDateDifferentWidget extends StatelessWidget {
  const NewsDateDifferentWidget({
    Key? key,
    required this.date,
  }) : super(key: key);
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    //I print the difference between the incoming DateTime type value and the current time on the screen.
    final dateDifference = DateTime.now().difference(date);
    final dateDay = dateDifference.inDays;
    final dateHour = dateDifference.inHours;
    final dateMinute = dateDifference.inMinutes;
    final dateSecond = dateDifference.inSeconds;

    return dateDay == 0
        ? dateHour == 0
            ? dateMinute == 0
                ? Text(
                    "$dateSecond  Seconds ago",
                    overflow: TextOverflow.ellipsis,
                    style: Styles.smallTextStyle.copyWith(fontSize: 10.sp, color: Colorss.textColor),
                  )
                : Text(
                    overflow: TextOverflow.ellipsis,
                    "$dateMinute Minutes ago",
                    style: Styles.smallTextStyle.copyWith(fontSize: 10.sp, color: Colorss.textColor),
                  )
            : Text(
                overflow: TextOverflow.ellipsis,
                "$dateHour  Hours ago",
                style: Styles.smallTextStyle.copyWith(fontSize: 10.sp, color: Colorss.textColor),
              )
        : Text(
            overflow: TextOverflow.ellipsis,
            "$dateDay Days ago",
            style: Styles.smallTextStyle.copyWith(fontSize: 10.sp, color: Colorss.textColor),
          );
  }
}
