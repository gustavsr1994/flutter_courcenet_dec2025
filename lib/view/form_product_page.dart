import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_courcenet_dec2025/statemanagement/provider/form_product_controller.dart';
import 'package:provider/provider.dart';

class FormProductPage extends StatelessWidget {
  const FormProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<FormProductController>();
    return Scaffold(
      appBar: AppBar(title: Text("Form Product")),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: controller.nameProductField,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Insert name product',
                labelText: 'Name Product',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: controller.qtyField,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Insert qty product',
                labelText: 'Qty',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: controller.categoryField,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Insert category product',
                labelText: 'Category Product',
              ),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () => controller.actionCaptureCamera(),
                child: Text("Capture Camera"),
              ),
              ElevatedButton(
                onPressed: () => controller.actionOpenGallery(),
                child: Text("Open Gallery"),
              ),
            ],
          ),
          controller.imageFile.path == ''
              ? SizedBox()
              : SizedBox(
                height: MediaQuery.sizeOf(context).height / 3,
                width: MediaQuery.sizeOf(context).width,
                child: Image.file(controller.imageFile),
              ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: controller.descriptionField,
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Insert description your product',
                labelText: 'Description',
              ),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Submit")),
        ],
      ),
    );
  }
}
