import 'package:dio/dio.dart';
import 'package:flutter_courcenet_dec2025/models/auth/login_response.dart';
import 'package:flutter_courcenet_dec2025/models/auth/register_response.dart';

class AuthRepository {
  Dio dio = Dio();

  Future<RegisterResponse> authRegister(Map<String, dynamic> request) async {
    try {
      var response = await dio.post(
        'http://10.0.2.2:8080/register',
        data: request,
      );
      var result = RegisterResponse.fromJson(response.data);
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<LoginResponse> authLogin(Map<String, dynamic> requestParams) async {
    try {
      var response = await dio.get(
        "http://10.0.2.2:8080/login",
        queryParameters: requestParams,
      );
      var result = LoginResponse.fromJson(response.data);
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
