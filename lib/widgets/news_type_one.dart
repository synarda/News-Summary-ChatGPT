// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatgpt_news_brief/models/article_model.dart';
import 'package:chatgpt_news_brief/screens/news_detail.dart';
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:chatgpt_news_brief/widgets/dark_gradient.dart';
import 'package:chatgpt_news_brief/widgets/news_date_different.dart';
import 'package:chatgpt_news_brief/widgets/news_source_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewsTypeOneWidget extends StatelessWidget {
  const NewsTypeOneWidget({
    Key? key,
    required this.news,
  }) : super(key: key);
  final ArticleModel news;
  @override
  Widget build(BuildContext context) {
    //apide creation date is given as String,
    //first I converted it to DateTime type,
    // then I printed the difference between today and today on the screen.
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(news.publishedAt!);
    var inputDate = DateTime.parse(parseDate.toString());
    return GestureDetector(
      onTap: () => Get.to(NewsDetailPage(news: news)),
      child: Container(
        height: 130.h,
        width: Get.width,
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r), color: Colorss.foreBackgroundColor),
        child: Row(children: [
          Container(
            height: 80.sp,
            width: 80.sp,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    height: 80.sp,
                    width: 80.sp,
                    fit: BoxFit.cover,
                    imageUrl: news.urlToImage!,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        const CupertinoActivityIndicator(color: Colorss.theme01Color),
                    errorWidget: (context, url, error) => Center(child: Image.asset("assets/images/noPhoto.png")),
                  ),
                ),
                DarkGradientWidget(height: 80.sp, width: 80.sp)
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  width: 150.w,
                  child: Text(news.author!,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.smallTextStyle.copyWith(color: Colorss.theme01Color, fontSize: 12.sp))),
              SizedBox(
                width: 240.w,
                child: Text(
                  news.content!,
                  style: Styles.smallTextStyle.copyWith(fontSize: 14.sp),
                  maxLines: 2,
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      NewsSourceAvatarWidget(size: 20, name: news.source!.name),
                      SizedBox(width: 4.w),
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          news.source!.name!,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.smallTextStyle.copyWith(fontSize: 10.sp),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: Colorss.textColor,
                        size: 20.sp,
                      ),
                      SizedBox(width: 4.w),
                      NewsDateDifferentWidget(date: inputDate)
                    ],
                  ),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
