import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/widgets/custom_app_bar.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/widgets/recipe_card.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/view_models/recipes_controller.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/getx_controller/user_controller.dart';

class BookmarkPage extends StatelessWidget {
  BookmarkPage({Key? key}) : super(key: key);

  final UserController uc = Get.put(UserController());
  final RecipesController _recipes = Get.put(RecipesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(uc: uc),
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.all(18),
                itemCount: _recipes.bookmarkedRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = _recipes.bookmarkedRecipes[index];
                  return RecipeCard(
                    image: recipe.image,
                    title: recipe.title,
                    price: recipe.price,
                    time: recipe.time,
                    ingredients: recipe.ingredients,
                    steps: recipe.steps,
                    bookmarked: recipe.bookmarked.value,
                    docName: recipe.docName,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
