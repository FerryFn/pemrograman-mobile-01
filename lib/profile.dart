import 'package:flutter/material.dart';
import 'profile_edit.dart';

import 'variables.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget separator() {
    return const SizedBox(
      height: 24,
    );
  }

  Widget headerText(String teks) {
    return Text(
      teks,
      style: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.w700, color: Colore.putih),
    );
  }

  Widget infoText(String teks) {
    return Text(
      teks,
      style: const TextStyle(fontSize: 20, color: Colore.putih),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuerySize = MediaQuery.of(context).size;
    return Container(
      width: mediaQuerySize.width,
      height: mediaQuerySize.height,
      color: Colore.biru,
      child: ListView(
        children: [
          SafeArea(
            child: Column(
              children: [
                separator(),
                Image.asset(
                  "assets/profile.png",
                  height: mediaQuerySize.width / 4,
                  width: mediaQuerySize.width / 4,
                ),
                separator(),
                Text(
                  User.name,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colore.putih,
                  ),
                ),
                separator(),
                Container(
                  margin: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      headerText("Username"),
                      infoText(User.username),
                      separator(),
                      headerText("Jenis Kelamin"),
                      infoText(User.gender),
                      separator(),
                      headerText("Email"),
                      infoText(User.email),
                      separator(),
                      headerText("Nomor Telepon"),
                      infoText(User.phone),
                      separator(),
                      SizedBox(
                        width: mediaQuerySize.width,
                        height: 64,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileEditPage(),
                              ),
                            ).then((value) {
                              setState(() {
                                
                              });
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colore.oranye,
                          ),
                          child: const Text(
                            "Edit Profil",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
