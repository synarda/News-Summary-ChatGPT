import 'package:chatgpt_news_brief/screens/summary_page.dart';
import 'package:chatgpt_news_brief/services/summary_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class NewsDetailController extends GetxController {
  //My function that communicates with AI.
  Future<void> summaryWithChatGPT(String message) async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    final result = await SummaryService.dioSummaryWithChatGPT(message);
    if (result != null) {
      //I send the returned result to the summary page.
      Get.dialog(SummaryPage(summary: result));
    }
    EasyLoading.dismiss();
  }
}
