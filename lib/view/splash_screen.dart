import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () => startInitialPage());
  }

  void startInitialPage() {
    final box = GetStorage();
    print("TOken: ${box.read("token")}");
    if (box.read("token") != null) {
      Get.offNamed('/product');
    } else {
      Get.offNamed('/register');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Welcome.....")));
  }
}
