// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatgpt_news_brief/models/article_model.dart';
import 'package:chatgpt_news_brief/widgets/news_type_one.dart';
import 'package:flutter/cupertino.dart';

class NewsListContainerWidget extends StatelessWidget {
  const NewsListContainerWidget({
    Key? key,
    required this.news,
  }) : super(key: key);
  final ArticleModel news;
  @override
  Widget build(BuildContext context) {
    //Again, I am doing some checks to avoid seeing empty news coming from the API.
    return news.content!.isEmpty || news.author!.isEmpty ? const SizedBox() : NewsTypeOneWidget(news: news);
  }
}
