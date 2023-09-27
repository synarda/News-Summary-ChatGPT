// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatgpt_news_brief/models/article_model.dart';
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:chatgpt_news_brief/widgets/dark_gradient.dart';
import 'package:chatgpt_news_brief/widgets/news_date_different.dart';
import 'package:chatgpt_news_brief/widgets/news_source_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TopNewsWidget extends StatelessWidget {
  const TopNewsWidget({
    Key? key,
    required this.news,
    required this.height,
    this.dateVisibility = true,
  }) : super(key: key);
  final ArticleModel news;
  final double height;
  final bool dateVisibility;
  @override
  Widget build(BuildContext context) {
    //apide creation date is given as String,
    //first I converted it to DateTime type,
    // then I printed the difference between today and today on the screen.
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(news.publishedAt!);
    var inputDate = DateTime.parse(parseDate.toString());
    return SizedBox(
      height: height - 20.h,
      width: Get.width,
      child: Stack(
        children: [
          ClipRRect(
            child: CachedNetworkImage(
              height: height + 20.h,
              width: Get.width,
              fit: BoxFit.cover,
              imageUrl: news.urlToImage!,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const CupertinoActivityIndicator(color: Colorss.theme01Color),
              errorWidget: (context, url, error) =>
                  Align(alignment: Alignment.center, child: Image.asset("assets/images/noPhoto.png")),
            ),
          ),
          DarkGradientWidget(radius: 0, height: height + 20.h, width: Get.width),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 32.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      news.title!,
                      style: Styles.smallTextStyle.copyWith(fontSize: 18.sp),
                      maxLines: 2,
                    ),
                    SizedBox(height: 24.h),
                    Row(children: [
                      Row(
                        children: [
                          NewsSourceAvatarWidget(size: 20, name: news.source!.name),
                          SizedBox(width: 4.w),
                          SizedBox(
                            width: dateVisibility ? 100.w : 150.w,
                            child: Text(
                              news.source!.name!,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.smallTextStyle.copyWith(fontSize: 10.sp),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 16.w),
                      //In the top news widget design, the same data was pulled in two different places. In order to facilitate
                      // sensitivity, if we are on the news detail page, I remove the time different data in the top widget.
                      dateVisibility
                          ? Row(
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  color: Colorss.textColor,
                                  size: 20.sp,
                                ),
                                SizedBox(width: 4.w),
                                NewsDateDifferentWidget(date: inputDate)
                              ],
                            )
                          : const SizedBox(),
                      const Spacer(),
                      SizedBox(
                          width: dateVisibility ? 100.w : 150.w,
                          child: Text(news.author!,
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.smallTextStyle.copyWith(color: Colorss.theme01Color, fontSize: 12.sp))),
                    ]),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
