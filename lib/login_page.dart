import 'package:flutter/material.dart';
import 'package:flutter_courcenet_dec2025/color_pallete.dart';
import 'package:flutter_courcenet_dec2025/custom_button.dart';
import 'package:flutter_courcenet_dec2025/home_page.dart';
import 'package:flutter_courcenet_dec2025/style_font_custom.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final keyForm = GlobalKey<FormState>();

  // SharedPreferences? pref;
  GetStorage box = GetStorage();
  TextEditingController nameField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  bool isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkSession();
  }

  void checkSession() async {
    //Shared Preference
    // pref = await SharedPreferences.getInstance();
    // if (pref!.getString('name') != null) {
    //   // Navigator.pushReplacementNamed(context, '/home');
    //   Get.offNamed('/home');
    // }
    //Get Storage
    print("Value: ${box.read("name")}");
    if (box.read("name") != null) {
      // Navigator.pushReplacementNamed(context, '/home');
      Get.offNamed('/home');
      setState(() {
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: fontColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Image.asset('assets/images/images.png'),
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: BoxDecoration(
                color: fontColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: bodyForm(),
            ),
          ],
        ),
      ),
    );
  }

  Widget bodyForm() {
    return Form(
      key: keyForm,
      child: ListView(
        children: [
          Center(child: Text("Smart HR Mobile")),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: nameField,
              keyboardType: TextInputType.text,
              maxLines: 3,
              validator: (value) {
                if (value == null || value == '') {
                  return 'Please, this field ';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: UnderlineInputBorder(),
                prefixIcon: Icon(Icons.man),
                labelText: 'Name',
                hintText: 'Insert your name',
                labelStyle: TextStyle(color: primaryColor),
              ),
              onChanged: (_) {
                setState(() {});
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: passwordField,
              obscureText: isVisible,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value == '') {
                  return 'Please, this field ';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: UnderlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: Icon(
                    isVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
                hintText: 'Insert your password',
                labelStyle: TextStyle(color: primaryColor),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          Row(
            children: [
              Checkbox(value: true, onChanged: (value) {}),
              Text("Remember Me"),
            ],
          ),
          // ElevatedButton(onPressed: onPressed, child: child),
          // IconButton(onPressed: onPressed, icon: icon),
          // TextButton(onPressed: onPressed, child: child),
          // OutlinedButton(onPressed: onPressed, child: child),
          // TextButton(onPressed: () {}, child: Text('Forget Password')),
          // InkWell(onTap: () {}, child: Text('Forget Password')),
          // GestureDetector(
          //   onTap: () {
          //     print("Forget Password");
          //   },
          //   child: Text('Forget Password'),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    side: BorderSide(color: primaryColor),
                  ),
                ),
                child: Text('Register'),
              ),
              SizedBox(width: 30),
              ElevatedButton(
                onPressed: () async {
                  if (keyForm.currentState!.validate()) {
                    // const snackBar = SnackBar(
                    //   content: Text('Success'),
                    //   duration: Duration(
                    //     seconds: 2,
                    //   ), // Optional: default is 4s
                    // );

                    // // Find the ScaffoldMessenger in the widget tree and use it to show the SnackBar
                    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => HomePage()),
                    // );

                    // pref!.setString('name', nameField.text);

                    // Navigator.pushNamed(context, '/home');
                    // Navigator.pushReplacementNamed(context, '/home');
                    // await box.write("name", nameField.text);
                    Get.offNamed('/home');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                child: Text(
                  "Login",
                  style: styleMediumFont(colorFont: fontColor, isBold: true),
                ),
              ),
            ],
          ),
          CustomButton('Submit 2', () => print('Submit')),
        ],
      ),
    );
  }
}
