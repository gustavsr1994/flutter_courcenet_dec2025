import 'package:dio/dio.dart';
import 'package:flutter_courcenet_dec2025/models/product/all_product_response.dart';
import 'package:get_storage/get_storage.dart' hide Data;

class ProductRepository {
  Dio dio = Dio();
  final box = GetStorage();

  Future<AllProductResponse> fetchAllProduct() async {
    try {
      var token = box.read("token");
      dio.options = BaseOptions(headers: {"Authorization": token});
      var response = await dio.get("http://10.0.2.2:8080/product");
      var result = AllProductResponse.fromJson(response.data);
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future deleteProduct(int id) async {
    try {
      var token = box.read("token");
      dio.options = BaseOptions(headers: {"Authorization": token});
      await dio.delete("http://10.0.2.2:8080/product/$id");
    } catch (e) {
      // print("Error: ${e.to}")
      throw Exception(e.toString());
    }
  }

  Future insertProduct(Map<String, dynamic> request) async {
    try {
      var token = box.read("token");
      dio.options = BaseOptions(headers: {"Authorization": token});
      final formRequest = FormData.fromMap(request);
      await dio.post(
        "http://10.0.2.2:8080/product",
        data: formRequest,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );
    } catch (e) {
      // print("Error: ${e.to}")
      throw Exception(e.toString());
    }
  }

  Future updateProduct(Map<String, dynamic> request) async {
    try {
      var token = box.read("token");
      dio.options = BaseOptions(headers: {"Authorization": token});
      final formRequest = FormData.fromMap(request);
      await dio.put(
        "http://10.0.2.2:8080/product",
        data: formRequest,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );
    } catch (e) {
      // print("Error: ${e.to}")
      throw Exception(e.toString());
    }
  }

  Future<Data> fetchDetailProduct(int id) async {
    try {
      var token = box.read("token");
      dio.options = BaseOptions(headers: {"Authorization": token});
      var response = await dio.get("http://10.0.2.2:8080/product/$id");
      var result = Data.fromJson(response.data['data']);
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
