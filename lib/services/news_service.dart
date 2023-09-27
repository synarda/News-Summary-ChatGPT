// ignore_for_file: avoid_print

import 'package:chatgpt_news_brief/models/article_model.dart';
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:dio/dio.dart';

class NewsService {
  static Future<Dio> dioAuth() async {
    BaseOptions options = BaseOptions(
      baseUrl: Const.apiUrl,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      responseType: ResponseType.json,
    );

    return Dio(options);
  }

  static Future<List<ArticleModel>?> getNewsTopHeadLines() async {
    try {
      Dio dio = await dioAuth();
      Response response = await dio.get("/top-headlines?country=us&apiKey=${Const.apiKey}");
      if (response.statusCode == 200) {
        List<dynamic> list = response.data["articles"];
        return list.map((e) => ArticleModel.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<List<ArticleModel>?> getNewsWithCategory(String category) async {
    try {
      Dio dio = await dioAuth();
      Response response = await dio.get("/everything?q=$category&apiKey=${Const.apiKey}");
      if (response.statusCode == 200) {
        List<dynamic> list = response.data["articles"];
        return list.map((e) => ArticleModel.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
