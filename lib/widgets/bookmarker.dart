// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatgpt_news_brief/controllers/global_controller.dart';
import 'package:chatgpt_news_brief/models/article_model.dart';
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookmarkWidget extends StatefulWidget {
  const BookmarkWidget({
    Key? key,
    required this.news,
  }) : super(key: key);
  final ArticleModel news;
  @override
  State<BookmarkWidget> createState() => _BookmarkWidgetState();
}

class _BookmarkWidgetState extends State<BookmarkWidget> {
  bool isMarked = false;
  @override
  void initState() {
    //at the first login I check if the news is bookmarked.
    checkMark(widget.news);
    super.initState();
  }

//I check if the news is bookmarked.
  void checkMark(ArticleModel news) async {
    if (Get.find<GlobalController>().bookMarkList.contains(news)) {
      setState(() {
        isMarked = true;
      });
    } else {
      setState(() {
        isMarked = false;
      });
    }
  }

//I change the icon and action according to the touch.
  void toggleMark() {
    if (mounted) {
      setState(() {
        isMarked = !isMarked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          toggleMark();
          if (isMarked) {
            Get.find<GlobalController>().bookMarkList.add(widget.news);
          } else {
            Get.find<GlobalController>().bookMarkList.remove(widget.news);
          }
        },
        icon: Icon(
          isMarked ? Icons.bookmark : Icons.bookmark_border,
          color: Colorss.textColor,
          size: 30.sp,
        ));
  }
}
