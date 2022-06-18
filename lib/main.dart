import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/utils/user_route_processing.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/utils/palette.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/pages/landing_page.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/pages/login_page.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/pages/main_page.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/pages/profile_edit_page.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/pages/registration_page.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "CookFox",
      home: const SplashScreen(),
      theme: ThemeData(
        fontFamily: "Quicksand",
        primaryColor: Palette.blue,
      ),
      routes: {
        "/landing": (context) => const LandingPage(),
        "/user_route": (context) => const UserRouteProcessing(),
        "/main": (context) => MainPage(),
        "/login": (context) => LoginPage(),
        "/register": (context) => RegistrationPage(),
        "/profile_edit": (context) => ProfileEditPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
