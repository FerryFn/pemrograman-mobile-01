import 'package:flutter/material.dart';

import 'main_page.dart';
import 'landing_page.dart';
import 'profile.dart';
import 'profile_edit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/main': (context) => const MainPage(),
        '/profil': (context) => const ProfilePage(),
        '/profil_edit': (context) => const ProfileEditPage(),
      },
    );
  }
}
