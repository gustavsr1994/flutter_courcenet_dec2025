import 'package:flutter_courcenet_dec2025/statemanagement/getx/get_controller.dart';
import 'package:get/get.dart';

class GetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetController());
  }
}
