import 'package:flutter/material.dart';

class ProviderController with ChangeNotifier {
  bool visibleImageNetwork = true;

  void changeStatus(){
    visibleImageNetwork = !visibleImageNetwork;
    notifyListeners();
  }
}