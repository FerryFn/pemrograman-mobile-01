import 'dart:async';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit;
    splashScreenStart();
  }

  splashScreenStart() {
    Duration duration = const Duration(seconds: 3);
    return Timer(
      duration,
      () {
        Get.offNamed("/user_route");
      },
    );
  }
}