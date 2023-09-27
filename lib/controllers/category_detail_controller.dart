import 'package:chatgpt_news_brief/models/article_model.dart';
import 'package:chatgpt_news_brief/services/news_service.dart';
import 'package:get/get.dart';

class CategoryDetailController extends GetxController {
  //I'm taking the category out of my control.
  final newsListCategoryDetail = <ArticleModel>[].obs;

  //pull news according to the selected category.
  Future<void> getNewsWithCategory(String category) async {
    newsListCategoryDetail.clear();
    final result = await NewsService.getNewsWithCategory(category);
    if (result != null) {
      newsListCategoryDetail.value = result;

      //Some data is sent incorrectly or empty due to the API. I prevented this a little bit with a for loop.
      for (var i = 0; i < newsListCategoryDetail.length; i++) {
        if (newsListCategoryDetail[i].author!.isEmpty ||
            newsListCategoryDetail[i].author == "Removed" ||
            newsListCategoryDetail[i].content!.isEmpty) {
          newsListCategoryDetail.removeAt(i);
        }
      }
    }
  }
}
