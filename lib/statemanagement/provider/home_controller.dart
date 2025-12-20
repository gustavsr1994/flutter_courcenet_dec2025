import 'package:flutter/material.dart';
import 'package:flutter_courcenet_dec2025/color_pallete.dart';

class HomeController with ChangeNotifier {
  Color colorHeader = primaryColor;

  void changeColor(Color colorValue){
    colorHeader = colorValue;
    notifyListeners();
  }
}