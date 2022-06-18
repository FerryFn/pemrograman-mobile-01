import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/getx_controller/splash_screen_controller.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/utils/palette.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    SplashScreenController ssc = Get.put(SplashScreenController());
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Palette.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icon/cookfox.png",
              height: width / 2,
              width: width / 2,
            ),
            const Text(
              "CookFox",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Palette.white,
              ),
            ),
            const Text(
              "v0.0.4",
              style: TextStyle(
                fontSize: 16,
                color: Palette.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
