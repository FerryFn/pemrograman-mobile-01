import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/utils/palette.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/getx_controller/recipe_form_controller.dart';

class RecipeForm extends StatelessWidget {
  RecipeForm({
    Key? key,
    required this.editMode,
    this.docName,
    this.onUpload,
    this.onSubmit,
  }) : super(key: key);

  final bool editMode;
  final String? docName;
  final Function? onUpload;
  final Function? onSubmit;
  final RecipeFormController recipeFormController =
      Get.put(RecipeFormController());

  Widget batas() {
    return const SizedBox(
      height: 24,
    );
  }

  Widget inputBox({
    required TextEditingController controller_,
    required String text,
    dynamic type = TextInputType.text,
    int minLines = 1,
  }) {
    return TextField(
      minLines: minLines,
      maxLines: 10,
      keyboardType: type,
      controller: controller_,
      decoration: InputDecoration(
        labelText: text,
        fillColor: Colors.white,
        filled: true,
      ),
      style: const TextStyle(
        fontSize: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String textTitle = editMode ? "Perbarui" : "Tambahkan";
    var mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(textTitle),
        backgroundColor: Palette.blue,
      ),
      backgroundColor: Palette.blue,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Obx(
            () => (recipeFormController.path.value.isNotEmpty)
                ? Image.file(recipeFormController.file)
                : Container(),
          ),
          batas(),
          SizedBox(
            width: mediaQuerySize.width,
            height: 64,
            child: ElevatedButton(
              onPressed: () async {
                if (onUpload != null) onUpload!();
              },
              style: ElevatedButton.styleFrom(
                primary: Palette.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Unggah Gambar",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          batas(),
          inputBox(
            controller_: recipeFormController.titleController,
            text: "Judul",
          ),
          batas(),
          inputBox(
            controller_: recipeFormController.priceController,
            text: "Harga",
          ),
          batas(),
          inputBox(
            controller_: recipeFormController.timeController,
            text: "Waktu",
            type: TextInputType.number,
          ),
          batas(),
          inputBox(
            controller_: recipeFormController.ingredientsController,
            text: "Bahan-Bahan",
            type: TextInputType.multiline,
            minLines: 3,
          ),
          batas(),
          inputBox(
            controller_: recipeFormController.stepsController,
            text: "Langkah-Langkah",
            type: TextInputType.multiline,
            minLines: 3,
          ),
          batas(),
          batas(),
          SizedBox(
            width: mediaQuerySize.width,
            height: 64,
            child: ElevatedButton(
              onPressed: () async {
                if (onSubmit != null) onSubmit!();
              },
              style: ElevatedButton.styleFrom(
                primary: Palette.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                textTitle,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
