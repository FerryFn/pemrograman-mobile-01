import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInUpController extends GetxController {
  List<String> genderList = ["Laki-Laki", "Perempuan"];
  var gender = "".obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
}
