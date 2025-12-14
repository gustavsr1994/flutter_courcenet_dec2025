import 'package:flutter/material.dart';
import 'package:flutter_courcenet_dec2025/body/first_body.dart';
import 'package:flutter_courcenet_dec2025/body/second_body.dart';
import 'package:flutter_courcenet_dec2025/body/three_body.dart';
import 'package:flutter_courcenet_dec2025/style_font_custom.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'color_pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences? pref;
  String name = '';
  int indexPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialData();
  }

  Future initialData() async {
    pref = await SharedPreferences.getInstance();
    name = pref!.getString('name') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
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
              pref!.clear();
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
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.portrait), label: 'Profile'),
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
      default:
        return SizedBox();
    }
  }
}
