import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/model/recipe.dart';

class RecipesController extends GetxController {
  final RxList _recipes = [].obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    _recipes.clear();
    await FirebaseFirestore.instance.collection("recipes").get().then(
          (value) => {
            for (var i in value.docs)
              {
                _recipes.add(
                  Recipe(
                    docName: i.id,
                    title: i.get("title"),
                    image: i.get("image"),
                    time: i.get("time").toString(),
                    price: i.get("price"),
                    ingredients: i.get("ingredients"),
                    steps: i.get("steps"),
                    bookmarked: i.get("bookmarked"),
                  ),
                ),
              },
          },
        );
  }

  List<Recipe> get recipes {
    return [..._recipes];
  }

  List get bookmarkedRecipes {
    return _recipes.where((item) => item.bookmarked.value).toList();
  }

  void removeRecipe(String docName) async {
    final int index =
        _recipes.indexWhere((recipe) => recipe.docName == docName);
    _recipes.removeAt(index);
  }

  bool checkBookmarked(String docName) {
    final int index =
        _recipes.indexWhere((recipe) => recipe.docName == docName);
    return _recipes[index].bookmarked.value;
  }

  void bookmark(String docName) {
    final int index =
        _recipes.indexWhere((recipe) => recipe.docName == docName);
    _recipes[index].bookmarked.value = !_recipes[index].bookmarked.value;
    FirebaseFirestore.instance.collection("recipes").doc(docName).update({
      "bookmarked": _recipes[index].bookmarked.value,
    });
  }
}
