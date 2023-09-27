import 'package:chatgpt_news_brief/services/news_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Get News Top HeadLines", () async {
    final result = await NewsService.getNewsTopHeadLines();
    expect(result!.isNotEmpty, true);
  });

  test("Get News With Category", () async {
    final result = await NewsService.getNewsWithCategory("Technology");
    expect(result!.isNotEmpty, true);
  });
}
