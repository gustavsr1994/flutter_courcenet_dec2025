import 'package:flutter/material.dart';
import 'package:flutter_courcenet_dec2025/repository/auth_repository.dart';
import 'package:flutter_courcenet_dec2025/statemanagement/provider/main_product_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class HomeProductPage extends StatelessWidget {
  const HomeProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MainProductController>();
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Produk"), leading: BackButton(onPressed: () {
        final box = GetStorage();
        box.erase();
        Get.offAllNamed('/register');
      },),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: controller.getAllProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var item = snapshot.data![index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.red),
                      ),
                      child: ListTile(
                        title: Text(item.name ?? ''),
                        subtitle: Text(item.category ?? ''),
                        trailing: IconButton(
                          onPressed:
                              () => controller.actionDelete(item.id ?? 0),
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text(
                    "No Data",
                    style: TextStyle(color: Colors.red, fontSize: 30),
                  ),
                );
              }
            } else {
              return Center(
                child: Text(
                  "Error",
                  style: TextStyle(color: Colors.red, fontSize: 30),
                ),
              );
            }
          } else {
            return Center(
              child: Text(
                "No Data",
                style: TextStyle(color: Colors.red, fontSize: 30),
              ),
            );
          }
        },
      ),
    );
  }
}
