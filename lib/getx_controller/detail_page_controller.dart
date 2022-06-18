import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailPageController extends GetxController {
  var title = "".obs;
  var price = "".obs;
  var time = "".obs;
  var ingredients = "".obs;
  var steps = "".obs;
  String docName;

  DetailPageController(this.docName);

  @override
  void onInit() {
    fillVariables(docName);
    super.onInit();
  }

  fillVariables(String docName) async {
    await FirebaseFirestore.instance
        .collection("recipes")
        .doc(docName)
        .get()
        .then((value) {
          title.value = value.get("title");
          price.value = value.get("price");
          time.value = value.get("time").toString();
          ingredients.value = value.get("ingredients");
          steps.value = value.get("steps");
        });
  }
}
