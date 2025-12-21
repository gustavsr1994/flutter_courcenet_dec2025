import 'package:flutter/material.dart';
import 'package:flutter_courcenet_dec2025/repository/auth_repository.dart';

class HomeProductPage extends StatelessWidget {
  const HomeProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Produk")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AuthRepository().authRegister({
            "username": "tono",
            "password": "123456",
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
