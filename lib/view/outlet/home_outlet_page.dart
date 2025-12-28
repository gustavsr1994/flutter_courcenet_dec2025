import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_courcenet_dec2025/repository/outlet_repository.dart';
import 'package:flutter_courcenet_dec2025/view/outlet/form_outlet_page.dart';
import 'package:get/get.dart';

class HomeOutletPage extends StatelessWidget {
  const HomeOutletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Outlet")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(FormOutletPage("0"));
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: OutletRepository().fetchOutlet(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error.toString()}"));
          }
          if (snapshot.data == null) {
            return Center(child: Text("No Data"));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var item = snapshot.data!.docs[index];
              return Card(
                child: ListTile(
                  title: Text(item['name']),
                  subtitle: Text(
                    'Hour Operation: ${item['hour_operation']['open']} - ${item['hour_operation']['close']}',
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(onTap: () => Get.to(FormOutletPage(item.id)), child: Text("Edit")),
                      InkWell(
                        onTap: () => OutletRepository().deleteOutlet(item.id),
                        child: Text("Delete"),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
