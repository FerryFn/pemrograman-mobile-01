import 'package:get/get.dart';

class Recipe {
  String image;
  String title;
  String price;
  String time;
  String ingredients;
  String steps;
  RxBool bookmarked = false.obs;
  String docName;

  Recipe({
    required this.image,
    required this.title,
    required this.price,
    required this.time,
    required this.ingredients,
    required this.steps,
    this.docName = "",
    bool bookmarked = false,
  }) {
    if (bookmarked) {
      this.bookmarked.value = true;
    }
  }
}
