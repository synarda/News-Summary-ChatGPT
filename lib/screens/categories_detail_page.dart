// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatgpt_news_brief/controllers/category_detail_controller.dart';
import 'package:chatgpt_news_brief/screens/drawer_page.dart';
import 'package:chatgpt_news_brief/screens/news_detail.dart';
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:chatgpt_news_brief/widgets/animated_listview.dart';
import 'package:chatgpt_news_brief/widgets/appbar.dart';
import 'package:chatgpt_news_brief/widgets/home_shimmer.dart';
import 'package:chatgpt_news_brief/widgets/news_list_container.dart';
import 'package:chatgpt_news_brief/widgets/top_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoriesDetailPage extends StatelessWidget {
  const CategoriesDetailPage({
    Key? key,
    required this.category,
  }) : super(key: key);
  final String category;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CategoryDetailController>();

    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: const DrawerPage(),
      backgroundColor: Colorss.backGroundColor,
      appBar: PreferredSize(
          preferredSize: Size(Get.width, 80.h), child: AppbarWidget(leadingVisiblity: true, title: category)),
      body: Obx(() => controller.newsListCategoryDetail.isEmpty
          ? const HomeShimmerWidget()
          : RefreshIndicator(
              onRefresh: () => controller.getNewsWithCategory(category),
              child: AnimatedListView(physics: const BouncingScrollPhysics(), children: [
                GestureDetector(
                    onTap: () => Get.to(NewsDetailPage(news: controller.newsListCategoryDetail.first)),
                    key: ValueKey("${controller.newsListCategoryDetail.first.url}first"),
                    child: TopNewsWidget(news: controller.newsListCategoryDetail.first, height: 280)),
                ...controller.newsListCategoryDetail
                    .map((e) => SizedBox(key: ValueKey(e.url), child: NewsListContainerWidget(news: e)))
                    .toList(),
              ]),
            )),
    );
  }
}
