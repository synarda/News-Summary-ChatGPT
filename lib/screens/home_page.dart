import 'package:chatgpt_news_brief/controllers/home_controller.dart';
import 'package:chatgpt_news_brief/screens/drawer_page.dart';
import 'package:chatgpt_news_brief/screens/news_detail.dart';
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:chatgpt_news_brief/widgets/appbar.dart';
import 'package:chatgpt_news_brief/widgets/home_shimmer.dart';
import 'package:chatgpt_news_brief/widgets/news_list_container.dart';
import 'package:chatgpt_news_brief/widgets/top_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: const DrawerPage(),
      backgroundColor: Colorss.backGroundColor,
      appBar: PreferredSize(
          preferredSize: Size(Get.width, 80.h), child: const AppbarWidget(leadingVisiblity: true, title: "News Feed")),
      body: Obx(() => controller.newsList.isEmpty
          ? const HomeShimmerWidget()
          : RefreshIndicator(
              onRefresh: controller.getNewsTopHeadLines,
              child: ListView(physics: const BouncingScrollPhysics(), children: [
                GestureDetector(
                    onTap: () => Get.to(NewsDetailPage(news: controller.newsList.first)),
                    child: TopNewsWidget(news: controller.newsList.first, height: 280)),
                ...controller.newsList.map((e) => NewsListContainerWidget(news: e)).toList(),
              ]),
            )),
    );
  }
}
