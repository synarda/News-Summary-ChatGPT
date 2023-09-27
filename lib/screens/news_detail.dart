// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatgpt_news_brief/controllers/news_detail_controller.dart';
import 'package:chatgpt_news_brief/models/article_model.dart';
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:chatgpt_news_brief/widgets/bookmarker.dart';
import 'package:chatgpt_news_brief/widgets/news_date_different.dart';
import 'package:chatgpt_news_brief/widgets/top_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({
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
    final controller = Get.put(NewsDetailController());
    return Scaffold(
      backgroundColor: Colorss.backGroundColor,
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Stack(
                children: [
                  GestureDetector(
                      onTap: () => launch(news.url!),
                      child: TopNewsWidget(news: news, height: 320.h, dateVisibility: false)),
                  Positioned(
                    left: 16.w,
                    top: 24.h,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100.r),
                      onTap: Get.back,
                      child: Container(
                        height: 50.sp,
                        width: 50.sp,
                        decoration:
                            BoxDecoration(color: Colorss.theme01Color, borderRadius: BorderRadius.circular(100.r)),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colorss.textColor,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 16.w,
                    top: 24.h,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100.r),
                      onTap: () => controller.summaryWithChatGPT(news.description! + news.content!),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Container(
                            height: 50.sp,
                            width: 50.sp,
                            decoration:
                                BoxDecoration(color: Colorss.theme01Color, borderRadius: BorderRadius.circular(100.r)),
                            child: Image.network(
                                "https://b2203234.smushcdn.com/2203234/wp-content/uploads/2023/05/64063dbcad97bd421b437096_chatgpt.jpg?lossy=0&strip=1&webp=1",
                                fit: BoxFit.cover)),
                      ).animate(
                        onComplete: (controller) {
                          controller.forward(from: 0.0);
                        },
                      ).shimmer(duration: 2000.ms, delay: 750.ms, color: Colorss.textColor),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(32.0.sp),
                child: Column(
                  children: [
                    //in the api description and content are given briefly,
                    // followed by expressions such as [+230]. i added it
                    //several times in a row so that the description part can be seen longer.
                    //don't worry, I sent only one to chatGPT.
                    Text(news.description!, style: Styles.smallTextStyle),
                    Text(news.content!, style: Styles.smallTextStyle),
                    Text(news.description!, style: Styles.smallTextStyle),
                    Text(news.content!, style: Styles.smallTextStyle),
                    Text(news.description!, style: Styles.smallTextStyle),
                    Text(news.content!, style: Styles.smallTextStyle),
                  ],
                ),
              ),
              Divider(
                color: Colorss.textColor,
                endIndent: 32.w,
                indent: 32.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Row(
                  children: [
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
                    const Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.comment_outlined,
                          color: Colorss.textColor,
                          size: 30.sp,
                        ),
                        SizedBox(width: 8.w),
                        Icon(
                          Icons.share_outlined,
                          color: Colorss.textColor,
                          size: 30.sp,
                        ),
                        SizedBox(width: 8.w),
                        BookmarkWidget(news: news),
                        SizedBox(width: 16.w),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
