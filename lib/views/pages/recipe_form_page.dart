import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/utils/palette.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/utils/image_service.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/getx_controller/detail_page_controller.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/getx_controller/recipe_form_controller.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/view_models/recipes_controller.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/widgets/recipe_form_page.dart';

Widget recipeAddForm() {
  final RecipeFormController rfc = Get.put(RecipeFormController());
  final RecipesController rc = Get.put(RecipesController());
  return RecipeForm(
    editMode: false,
    onUpload: () async {
      final results = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ["png", "jpg"],
      );

      if (results == null) {
        Get.snackbar(
          "Gagal!",
          "Tidak ada yang diunggah",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Palette.orange,
          colorText: Palette.white,
          margin: const EdgeInsets.all(12),
        );
        return;
      }

      rfc.path.value = results.files.single.path!;
      rfc.fileName.value = results.files.single.name;
    },
    onSubmit: () async {
      rfc.fileName.value = base64Url.encode(
            List<int>.generate(
              32,
              (i) => Random().nextInt(256),
            ),
          ) +
          rfc.fileName.value;

      if (rfc.path.value.isEmpty) {
        return;
      }
      await ImageService.uploadFile(rfc.path.value, rfc.fileName.value);
      await FirebaseFirestore.instance.collection("recipes").add({
        "title": rfc.titleController.text,
        "price": rfc.priceController.text,
        "time": rfc.timeController.text,
        "steps": rfc.stepsController.text,
        "ingredients": rfc.ingredientsController.text,
        "image": "recipe_image/${rfc.fileName.value}",
        "bookmarked": false,
      });

      rc.getData();

      Get.back();
      Get.snackbar(
        "Berhasil!",
        "Berhasil ditambahkan!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Palette.green,
        colorText: Palette.white,
        margin: const EdgeInsets.all(12),
      );
    },
  );
}

Widget recipeEditForm(String docName) {
  final RecipeFormController rfc = Get.put(RecipeFormController());
  final RecipesController rc = Get.put(RecipesController());
  final DetailPageController dpc = Get.put(DetailPageController(docName));
  rfc.fillTextController(docName);
  return RecipeForm(
    editMode: true,
    docName: docName,
    onUpload: () async {
      final results = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ["png", "jpg"],
      );

      if (results == null) {
        Get.snackbar(
          "Gagal!",
          "Tidak ada yang diunggah",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Palette.orange,
          colorText: Palette.white,
          margin: const EdgeInsets.all(12),
        );
        return;
      }

      rfc.path.value = results.files.single.path!;
      await FirebaseFirestore.instance
          .collection("recipes")
          .doc(docName)
          .get()
          .then((value) {
        rfc.fileName.value =
            value.get("image").toString().replaceFirst("recipe_image/", "");
      });
    },
    onSubmit: () async {
      if (rfc.path.value.isNotEmpty) {
        await ImageService.uploadFile(rfc.path.value, rfc.fileName.value);
      }
      await FirebaseFirestore.instance
          .collection("recipes")
          .doc(docName)
          .update({
        "title": rfc.titleController.text,
        "price": rfc.priceController.text,
        "time": rfc.timeController.text,
        "steps": rfc.stepsController.text,
        "ingredients": rfc.ingredientsController.text,
      });

      rc.getData();
      dpc.fillVariables(docName);

      Get.back();
      Get.snackbar(
        "Berhasil!",
        "Berhasil diperbarui!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Palette.green,
        colorText: Palette.white,
        margin: const EdgeInsets.all(12),
      );
    },
  );
}
