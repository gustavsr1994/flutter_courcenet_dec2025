import 'package:flutter/material.dart';
import 'package:flutter_courcenet_dec2025/repository/auth_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController with ChangeNotifier {
  final keyFormRegister = GlobalKey<FormState>();
  final keyFormLogin = GlobalKey<FormState>();

  TextEditingController usernameField = TextEditingController();
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();

  bool isVisible = true;
  bool isRegisterPage = true;
  AuthRepository repository = AuthRepository();

  void changeVisible() {
    isVisible = !isVisible;
    notifyListeners();
  }

  void changeForm() {
    isRegisterPage = !isRegisterPage;
    notifyListeners();
  }

  void actionRegister() async {
    if (keyFormRegister.currentState!.validate()) {
      Map<String, dynamic> request = {
        'username': usernameField.text,
        'email': emailField.text,
        'password': passwordField.text,
      };
      try {
        var result = await repository.authRegister(request);
        Get.snackbar(
          "Congratulation",
          result.message!,
          snackPosition: SnackPosition.BOTTOM,
        );
      } catch (e) {
        Get.snackbar(
          'Failed Register',
          'Error: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'Please, check your field',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void actionLogin() async {
    if (keyFormLogin.currentState!.validate()) {
      Map<String, dynamic> request = {
        'username': usernameField.text,
        'password': passwordField.text,
      };
      try {
        var result = await repository.authLogin(request);
        var box = GetStorage();
        if (result.token != "-") {
          box.write("token", result.token);
          Get.toNamed('/product');
        } else {
          Get.snackbar(
            'User not found',
            '',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } catch (e) {
        Get.snackbar(
          'Failed Login',
          'Error: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'Please, check your field',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
