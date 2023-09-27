import 'package:chatgpt_news_brief/screens/drawer_page.dart';
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:chatgpt_news_brief/widgets/appbar.dart';
import 'package:chatgpt_news_brief/widgets/categories_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: const DrawerPage(),
      backgroundColor: Colorss.backGroundColor,
      appBar: PreferredSize(
          preferredSize: Size(Get.width, 80.h), child: const AppbarWidget(leadingVisiblity: true, title: "Categories")),
      body: ListView(shrinkWrap: true, children: const [
        CategoriesContainerWidget(txt: "International", color: Color(0xffFFFF00), index: 1),
        CategoriesContainerWidget(txt: "Politics", color: Color(0xffFF0066), index: 2),
        CategoriesContainerWidget(txt: "Health & Sport", color: Color(0xff00FFCB), index: 3),
        CategoriesContainerWidget(txt: "Food & Travel", color: Color(0xffFF7700), index: 4),
        CategoriesContainerWidget(txt: "Technology", color: Color(0xff006EFF), index: 5),
        CategoriesContainerWidget(txt: "Education", color: Color(0xffB9FF00), index: 6),
        CategoriesContainerWidget(txt: "Covid19", color: Color(0xffFF00FF), index: 7),
        CategoriesContainerWidget(txt: "Entertaiment", color: Color(0xff8800FF), index: 8),
      ]),
    );
  }
}
