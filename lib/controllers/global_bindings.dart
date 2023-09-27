import 'package:chatgpt_news_brief/controllers/global_controller.dart';
import 'package:get/get.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    //I wrote my global controllers here so I can access the bookmark list from anywhere.
    Get.put(GlobalController());
  }
}
