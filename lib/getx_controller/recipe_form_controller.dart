import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipeFormController extends GetxController {
  var path = "".obs;
  var fileName = "".obs;

  File get file {
    return File(path.value);
  }

  void fillTextController(String docName) async {
    await FirebaseFirestore.instance
        .collection("recipes")
        .doc(docName)
        .get()
        .then((value) {
          titleController.text = value.get("title");
          priceController.text = value.get("price");
          timeController.text = value.get("time").toString();
          ingredientsController.text = value.get("ingredients");
          stepsController.text = value.get("steps");
        });
  }

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final timeController = TextEditingController();
  final ingredientsController = TextEditingController();
  final stepsController = TextEditingController();
}
