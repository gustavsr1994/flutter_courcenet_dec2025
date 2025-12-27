import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_courcenet_dec2025/repository/product_repository.dart';
import 'package:image_picker/image_picker.dart';

class FormProductController with ChangeNotifier {
  TextEditingController nameProductField = TextEditingController();
  TextEditingController qtyField = TextEditingController();
  TextEditingController categoryField = TextEditingController();
  TextEditingController descriptionField = TextEditingController();
  File imageFile = File('');
  ImagePicker imgPicker = ImagePicker();
  ProductRepository repository = ProductRepository();

  void initialPage(int id) async {
    if (id != 0) {
      var result = await repository.fetchDetailProduct(id);
      nameProductField.text = result.name ?? '';
      qtyField.text = result.qty.toString();
      categoryField.text = result.category ?? '';
      descriptionField.text = result.desc ?? '';
      imageFile = File(result.url ?? '');
    }else {
      nameProductField.clear();
      qtyField.clear();
      categoryField.clear();
      descriptionField.clear();
      imageFile = File('');
    }
  }

  void actionCaptureCamera() async {
    var result = await imgPicker.pickImage(source: ImageSource.camera);
    imageFile = File(result!.path);
    notifyListeners();
  }

  void actionOpenGallery() async {
    var result = await imgPicker.pickImage(source: ImageSource.gallery);
    imageFile = File(result!.path);
    notifyListeners();
  }

  void actionSubmit(BuildContext context) async {
    Map<String, dynamic> request = {
      'name_product': nameProductField.text,
      'qty': qtyField.text,
      'category': categoryField.text,
      'desc': descriptionField.text,
      'file': await MultipartFile.fromFile(
        imageFile.path,
        filename: imageFile.path.split('/').last,
      ),
    };
    try {
      await repository.insertProduct(request);
      Navigator.pop(context, 1);
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }

  void actionUpdate(BuildContext context, int id) async {
    Map<String, dynamic> request = {
      'id': id,
      'name_product': nameProductField.text,
      'qty': qtyField.text,
      'category': categoryField.text,
      'desc': descriptionField.text,
      'file': await MultipartFile.fromFile(
        imageFile.path,
        filename: imageFile.path.split('/').last,
      ),
    };
    try {
      await repository.updateProduct(request);
      Navigator.pop(context, 1);
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }
}
