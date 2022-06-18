import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/getx_controller/sign_in_up_form_controller.dart';

class SignInUpService {
  static final siufc = Get.find<SignInUpController>();

  static void signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: siufc.emailController.text.trim(),
        password: siufc.passwordController.text,
      );

      Get.offAllNamed("/user_route");
    } on FirebaseAuthException catch (e) {
      Get.dialog(
        AlertDialog(
          content: Text(e.message!),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Tutup"),
            ),
          ],
        ),
      );
    }
  }

  static void signUp() async {
    if (validateSignUp()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: siufc.emailController.text.trim(),
          password: siufc.passwordController.text,
        );

        var userID = FirebaseAuth.instance.currentUser!.uid;
        await FirebaseFirestore.instance.collection("users").doc(userID).set({
          "name": siufc.nameController.text,
          "email": siufc.emailController.text,
          "phone": siufc.phoneController.text,
          "gender": siufc.gender.value,
        });

        Get.offAllNamed("/user_route");
      } on FirebaseAuthException catch (e) {
        Get.dialog(
          AlertDialog(
            content: Text(e.message!),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text("Tutup"),
              ),
            ],
          ),
        );
      }
    }
  }

  static bool validateSignUp() {
    if (siufc.emailController.text.isEmpty ||
        siufc.passwordController.text.isEmpty ||
        siufc.passwordConfirmController.text.isEmpty ||
        siufc.nameController.text.isEmpty ||
        siufc.phoneController.text.isEmpty ||
        siufc.gender.value.isEmpty) {
      Get.dialog(
        AlertDialog(
          content: const Text("Masih ada kolom yang kosong!"),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Tutup"),
            ),
          ],
        ),
      );
      return false;
    }

    if (siufc.passwordController.text != siufc.passwordConfirmController.text) {
      Get.dialog(
        AlertDialog(
          content: const Text("Konfirmasi password tidak sama"),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Tutup"),
            ),
          ],
        ),
      );
      return false;
    }
    return true;
  }
}
