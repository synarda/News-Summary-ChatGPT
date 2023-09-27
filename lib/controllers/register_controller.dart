import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final isSwitch = true.obs;
  //I made it for a loading animation that looks like a fake database transaction time to the user.
  void futureDelay() {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    Future.delayed(const Duration(seconds: 1)).then((value) {
      EasyLoading.dismiss();
      Get.back();
    });
  }
}
