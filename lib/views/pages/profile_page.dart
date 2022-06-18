import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/getx_controller/user_controller.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/pages/landing_page.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/pages/profile_edit_page.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/utils/palette.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/widgets/separator_v.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final UserController uc = Get.put(UserController());

  Widget bigText(
      {required String text, bool bold = false, double size = 18.0}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        color: Palette.white,
        fontWeight: bold == true ? FontWeight.w700 : FontWeight.normal,
      ),
    );
  }

  Widget textRow(String text, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        bigText(text: text, bold: true),
        bigText(text: text2),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Palette.blue,
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          children: [
            CircleAvatar(
              radius: mediaQuerySize.width / 6,
              child: Image.asset("assets/icon/cookfox.png"),
            ),
            const SeparatorV(),
            Obx(
              () => bigText(
                text: uc.isAnonymous.value ? "Tamu" : uc.name.value,
                bold: true,
                size: 32,
              ),
            ),
            const SeparatorV(),
            if (!uc.isAnonymous.value)
              Column(
                children: [
                  const SeparatorV(),
                  Obx(() => textRow("Email", uc.email.value)),
                  const SeparatorV(),
                  Obx(() => textRow("Nomor Telepon", uc.phone.value)),
                  const SeparatorV(),
                  Obx(() => textRow("Gender", uc.gender.value)),
                  const SeparatorV(),
                  const SeparatorV(),
                  SizedBox(
                    width: mediaQuerySize.width,
                    height: 64,
                    child: ElevatedButton(
                      onPressed: () {
                        uc.nameController.text = uc.name.value;
                        uc.emailController.text = uc.email.value;
                        uc.phoneController.text = uc.phone.value;
                        Get.toNamed("/profile_edit");
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Palette.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Edit Profil",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            const SeparatorV(),
            SizedBox(
              width: mediaQuerySize.width,
              height: 64,
              child: ElevatedButton(
                onPressed: () {
                  Get.off(() => const LandingPage());

                  if (uc.isAnonymous.value) {
                    FirebaseAuth.instance.currentUser!.delete();
                  }
                  FirebaseAuth.instance.signOut();
                },
                style: ElevatedButton.styleFrom(
                  primary: Palette.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Keluar",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
