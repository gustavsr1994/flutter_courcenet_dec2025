import 'package:flutter/material.dart';
import 'package:flutter_courcenet_dec2025/home_page.dart';
import 'package:flutter_courcenet_dec2025/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage()
      },
      home: LoginPage()
      //HomePage()
    );
  }
}
