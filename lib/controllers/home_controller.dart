import 'package:chatgpt_news_brief/models/article_model.dart';
import 'package:chatgpt_news_brief/services/news_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final newsList = <ArticleModel>[].obs;
  @override
  void onInit() {
    getNewsTopHeadLines();
    super.onInit();
  }

  Future<void> getNewsTopHeadLines() async {
    //I took 20 news that are on the agenda of the country at the moment on the homepage.
    final result = await NewsService.getNewsTopHeadLines();
    if (result != null) {
      newsList.value = result;
      //Some data is sent incorrectly or empty due to the API. I prevented this a little bit with a for loop.
      for (var i = 0; i < newsList.length; i++) {
        if (newsList[i].author!.isEmpty || newsList[i].author == "Removed" || newsList[i].content!.isEmpty) {
          newsList.removeAt(i);
        }
      }
    }
  }
}
