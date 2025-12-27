import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormProductController with ChangeNotifier {
  TextEditingController nameProductField = TextEditingController();
  TextEditingController qtyField = TextEditingController();
  TextEditingController categoryField = TextEditingController();
  TextEditingController descriptionField = TextEditingController();
  File imageFile = File('');
  ImagePicker imgPicker = ImagePicker();

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
}
