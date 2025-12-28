import 'package:flutter/material.dart';
import 'package:flutter_courcenet_dec2025/config_notification.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initialNotif();
    Future.delayed(Duration(seconds: 3), () => startInitialPage());
  }

  void initialNotif() async {
    PermissionStatus permissionStatus = await Permission.notification.status;
    if (permissionStatus == PermissionStatus.denied) {
      var result = await ConfigNotification().requestPermissionNotification();
      if (result) {
        ConfigNotification().initialNotification();
      }
    }
    if (permissionStatus == PermissionStatus.granted) {
      ConfigNotification().initialNotification();
    }
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
