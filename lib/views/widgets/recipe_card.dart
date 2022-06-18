import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/utils/image_service.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/pages/detail_page.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/view_models/recipes_controller.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.time,
    required this.ingredients,
    required this.steps,
    required this.bookmarked,
    required this.docName,
  }) : super(key: key);

  final String image;
  final String title;
  final String price;
  final String time;
  final String ingredients;
  final String steps;
  final bool bookmarked;
  final String docName;

  @override
  Widget build(BuildContext context) {
    final RecipesController recipes = Get.put(RecipesController());
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Get.to(
            () => DetailPage(
              image: image,
              docName: docName,
            ),
          );
        },
        child: Container(
          height: 128,
          padding: const EdgeInsets.all(9),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: FutureBuilder(
                    future: ImageService.getImageURL(image),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(snapshot.data!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting ||
                          !snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }
                      return Container();
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 9,
              ),
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.timelapse,
                              size: 16,
                            ),
                            Text("${time}m"),
                          ],
                        ),
                        Text(price),
                        if (!FirebaseAuth.instance.currentUser!.isAnonymous)
                          Obx(
                            () => IconButton(
                              onPressed: () {
                                recipes.bookmark(docName);
                              },
                              icon: recipes.checkBookmarked(docName)
                                  ? const Icon(Icons.bookmark)
                                  : const Icon(Icons.bookmark_border),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
