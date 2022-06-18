import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/getx_controller/user_controller.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/utils/palette.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/widgets/input_box.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/views/widgets/separator_v.dart';

class ProfileEditPage extends StatelessWidget {
  ProfileEditPage({Key? key}) : super(key: key);

  final UserController uc = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    var mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profil"),
        backgroundColor: Palette.blue,
      ),
      backgroundColor: Palette.blue,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const SeparatorV(),
          CircleAvatar(
            radius: mediaQuerySize.width / 6,
            child: Image.asset("assets/icon/cookfox.png"),
          ),
          const SeparatorV(),
          InputBox(
            controller: uc.nameController,
            text: "Nama Lengkap",
          ),
          const SeparatorV(),
          InputBox(
            controller: uc.phoneController,
            text: "Nomor HP",
            type: TextInputType.phone,
          ),
          const SeparatorV(),
          const Text(
            "Jenis Kelamin",
            style: TextStyle(
                fontSize: 20,
                color: Palette.white,
                fontWeight: FontWeight.w600),
          ),
          for (var item in uc.genderList)
            Row(
              children: [
                Obx(
                  () => Radio(
                    activeColor: Palette.white,
                    value: item,
                    groupValue: uc.gender.value,
                    onChanged: (v) {
                      uc.gender.value = v.toString();
                    },
                  ),
                ),
                Text(
                  item,
                  style: const TextStyle(fontSize: 20, color: Palette.white),
                ),
              ],
            ),
          const SeparatorV(),
          SizedBox(
            width: mediaQuerySize.width,
            height: 64,
            child: ElevatedButton(
              onPressed: () {
                uc.updateInfo(
                  uc.nameController.text,
                  uc.emailController.text,
                  uc.phoneController.text,
                  uc.gender.value,
                );

                Get.back();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Profil berhasil disimpan!"),
                    backgroundColor: Palette.green,
                    padding: EdgeInsets.all(12),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Palette.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Simpan",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
