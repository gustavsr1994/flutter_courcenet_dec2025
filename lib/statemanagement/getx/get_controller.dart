import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GetController extends GetxController {
  bool isCensor = false;
  RxString value = "0".obs;
  TextEditingController textField = TextEditingController();

  void changeCensor() {
    isCensor = !isCensor;
    update();
  }

  void onChangeValue(String result) {
    value.value = result;
    Get.snackbar('Test', result, snackPosition: SnackPosition.BOTTOM);
  }
}
