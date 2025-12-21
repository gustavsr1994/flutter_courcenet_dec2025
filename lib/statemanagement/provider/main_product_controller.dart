import 'package:flutter/material.dart';
import 'package:flutter_courcenet_dec2025/repository/product_repository.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

import '../../models/product/all_product_response.dart';

class MainProductController with ChangeNotifier {
  ProductRepository repository = ProductRepository();

  Future<List<Data>> getAllProduct() async {
    try {
      var result = await repository.fetchAllProduct();
      return result.data ?? [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void actionDelete(int id) async {
    try {
      await repository.deleteProduct(id);
      notifyListeners();
    } catch (e) {
      Get.snackbar("Error", e.toString(), duration: Duration(seconds: 5), snackPosition: SnackPosition.BOTTOM);
    }
  }

  
}
