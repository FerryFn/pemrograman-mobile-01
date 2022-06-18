import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/pages/login_page.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/pages/main_page.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/utils/palette.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/widgets/landing_page_content.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuerySize = MediaQuery.of(context).size;
    PageController controller = PageController(initialPage: 0);

    return Scaffold(
      backgroundColor: Palette.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
          child: Stack(
            children: [
              PageView(
                controller: controller,
                children: const [
                  LandingPageContent(
                    image: "assets/landing_page/illus1.png",
                    header: "CookFox, Kuasai Dunia Kuliner",
                    desc:
                        "Dunia masak-memasak, semuanya lebih mudah, semuanya ada dalam genggaman Anda",
                  ),
                  LandingPageContent(
                    image: "assets/landing_page/illus2.png",
                    header: "Cari, Simpan, Masak",
                    desc:
                        "Anda dapat mencari dan menyimpan masakan favorit Anda untuk diikuti nantinya",
                  ),
                  LandingPageContent(
                    image: "assets/landing_page/illus3.png",
                    header: "Berbagai Macam Masakan untuk Dicoba!",
                    desc:
                        "Anda takkan bosan-bosannya menemukan masakan-masakan baru!",
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 72,
                  width: mediaQuerySize.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => LoginPage());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Palette.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Mulai Sekarang!",
                      style: TextStyle(
                        color: Palette.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signInAnonymously().then(
                        (value) => Get.off(
                          () => MainPage(),
                        ),
                      );
                },
                child: const Text(
                  "Lewati",
                  style: TextStyle(
                    color: Palette.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
