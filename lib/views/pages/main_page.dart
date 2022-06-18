import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/getx_controller/main_page_controller.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/pages/profile_page.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/pages/home_page.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/pages/bookmark_page.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/utils/palette.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  MainPageController mainPageController = Get.put(MainPageController());
  bool isNotAnonymous = !FirebaseAuth.instance.currentUser!.isAnonymous;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.blue,
      body: Obx(
        () => IndexedStack(
          index: mainPageController.tabIndex.value,
          children: [
            HomePage(),
            if (isNotAnonymous) BookmarkPage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: mainPageController.tabIndex.value,
          onTap: mainPageController.changeTabIndex,
          selectedItemColor: Palette.blue,
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Beranda",
            ),
            if (isNotAnonymous)
              const BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: "Disimpan",
              ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Akun",
            ),
          ],
        ),
      ),
    );
  }
}
