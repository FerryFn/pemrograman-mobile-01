import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var isAnonymous = false.obs;
  var name = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var gender = "".obs;

  List<String> genderList = ["Laki-Laki", "Perempuan"];

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    isAnonymous.value = FirebaseAuth.instance.currentUser!.isAnonymous;

    var userID = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection("users").doc(userID).get().then(
      (value) {
        name.value = value.get("name");
        email.value = value.get("email");
        phone.value = value.get("phone");
        gender.value = value.get("gender");
      },
    );
  }

  updateInfo(String newName, newEmail, newPhone, newGender) async {
    var userID = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection("users").doc(userID).update({
      "name": newName,
      "email": newEmail,
      "phone": newPhone,
      "gender": newGender,
    });

    name.value = newName;
    email.value = newEmail;
    phone.value = newPhone;
  }
}
