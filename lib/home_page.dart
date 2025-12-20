import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_courcenet_dec2025/body/first_body.dart';
import 'package:flutter_courcenet_dec2025/body/five_body.dart';
import 'package:flutter_courcenet_dec2025/body/four_body.dart';
import 'package:flutter_courcenet_dec2025/body/second_body.dart';
import 'package:flutter_courcenet_dec2025/body/three_body.dart';
import 'package:flutter_courcenet_dec2025/statemanagement/bloc/bloc_controller.dart';
import 'package:flutter_courcenet_dec2025/statemanagement/provider/home_controller.dart';
import 'package:flutter_courcenet_dec2025/style_font_custom.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'color_pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // SharedPreferences? pref;
  final box = GetStorage();
  String name = '';
  int indexPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialData();
  }

  Future initialData() async {
    // pref = await SharedPreferences.getInstance();
    // name = pref!.getString('name') ?? '';
    name = box.read("name");
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final item = context.watch<HomeController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor, //item.colorHeader,
        centerTitle: true,
        // leading: Icon(FontAwesomeIcons.hospital, color: fontColor),
        // leading: BackButton(color: fontColor),
        title: Text(
          "Home Page",
          style: styleMediumFont(colorFont: fontColor, isBold: true),
        ),
        actions: [
          Icon(Icons.notifications, color: fontColor),
          Icon(Icons.bookmark, color: fontColor),
          IconButton(
            onPressed: () {
              box.erase();
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: Icon(Icons.logout),
          ),
        ],
        iconTheme: IconThemeData(color: fontColor),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("Nama: $name")),
            ListTile(
              onTap: () => print('Test'),
              leading: Icon(Icons.favorite),
              title: Text('Favorite', style: TextStyle(color: Colors.red)),
              subtitle: Text('Halaman favorite'),
            ),
          ],
        ),
      ),
      body: bodyPage(),
    
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexPage,
        onTap: (value) {
          setState(() {
            indexPage = value;
          });
        },
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        selectedItemColor: Colors.amber,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.portrait),
            label: 'Profile',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_off_outlined),
            label: 'Bloc',
          ),
        ],
      ),
    );
  }

  Widget bodyPage() {
    switch (indexPage) {
      case 0:
        return FirstBody(name);
      case 1:
        return SecondBody();
      case 2:
        return ThreeBody();
      case 3:
        return FourBody();
      case 4:
        return FiveBody();
      default:
        return SizedBox();
    }
  }
}
