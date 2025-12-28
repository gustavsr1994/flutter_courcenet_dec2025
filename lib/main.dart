import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_courcenet_dec2025/body/four_body.dart';
import 'package:flutter_courcenet_dec2025/home_page.dart';
import 'package:flutter_courcenet_dec2025/map_page.dart';
import 'package:flutter_courcenet_dec2025/statemanagement/provider/form_product_controller.dart';
import 'package:flutter_courcenet_dec2025/view/form_product_page.dart';
import 'package:flutter_courcenet_dec2025/view/home_product_page.dart';
import 'package:flutter_courcenet_dec2025/login_page.dart';
import 'package:flutter_courcenet_dec2025/slicing_home_page.dart';
import 'package:flutter_courcenet_dec2025/statemanagement/bloc/bloc_controller.dart';
import 'package:flutter_courcenet_dec2025/statemanagement/getx/get_binding.dart';
import 'package:flutter_courcenet_dec2025/statemanagement/provider/auth_controller.dart';
import 'package:flutter_courcenet_dec2025/statemanagement/provider/home_controller.dart';
import 'package:flutter_courcenet_dec2025/statemanagement/provider/main_product_controller.dart';
import 'package:flutter_courcenet_dec2025/statemanagement/provider/provider_controller.dart';
import 'package:flutter_courcenet_dec2025/view/outlet/home_outlet_page.dart';
import 'package:flutter_courcenet_dec2025/view/register_page.dart';
import 'package:flutter_courcenet_dec2025/view/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage().initStorage;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderController()),
        ChangeNotifierProvider(create: (context) => HomeController()),
        ChangeNotifierProvider(create: (context) => AuthController()),
        ChangeNotifierProvider(create: (context) => MainProductController()),
        ChangeNotifierProvider(create: (context) => FormProductController()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        // routes: {
        //   '/home': (context) => HomePage(),
        //   '/login': (context) => LoginPage(),
        // },
        getPages: [
          GetPage(name: '/login', page: () => LoginPage()),
          GetPage(name: '/home', page: () => HomePage(), binding: GetBinding()),
          GetPage(name: '/register', page: () => RegisterPage()),
          GetPage(name: '/product', page: () => HomeProductPage()),
          // GetPage(name: '/form', page: () => FormProductPage(),)
          GetPage(name: '/outlet', page: () => HomeOutletPage()),
        ],
        home: SplashScreen(),
        //MapPage()
        //LoginPage(),
        //HomePage()
      ),
    );
    // return BlocProvider(
    //   create: (context) => BlocController("..."),
    //   child: GetMaterialApp(
    //     title: 'Flutter Demo',
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(),
    //     // routes: {
    //     //   '/home': (context) => HomePage(),
    //     //   '/login': (context) => LoginPage(),
    //     // },
    //     getPages: [
    //       GetPage(name: '/login', page: () => LoginPage()),
    //       GetPage(name: '/home', page: () => HomePage(), binding: GetBinding()),
    //     ],
    //     home:SlicingHomePage()
    //     //LoginPage(),
    //     //HomePage()
    //   ),
    // );
  }
}
