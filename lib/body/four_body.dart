import 'package:flutter/material.dart';
import 'package:flutter_courcenet_dec2025/statemanagement/getx/get_controller.dart';
import 'package:get/get.dart';

class FourBody extends GetView<GetController> {
  const FourBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.textField,
              onChanged: (value) => controller.onChangeValue(value),
            ),
          ),
          GetBuilder<GetController>(
            builder:
                (cont) => Text(
                  "Saldo: ${cont.isCensor ? "1****" : "1000000000"}",
                ),
          ),
          Obx(() => Text(controller.value.value),),
          ElevatedButton(
            onPressed: () => controller.changeCensor(),
            child: Text("Censor Wording"),
          ),
        ],
      ),
    );
  }
}
