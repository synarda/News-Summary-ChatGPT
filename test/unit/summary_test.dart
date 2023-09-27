import 'package:chatgpt_news_brief/services/summary_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Get Summary With ChatGPT", () async {
    final result = await SummaryService.dioSummaryWithChatGPT("hi");
    expect(result!.isNotEmpty, true);
  });
}
