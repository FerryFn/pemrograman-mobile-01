import 'package:flutter/material.dart';

import 'variables.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({ Key? key }) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  List<String> genderList = ["Laki-laki", "Perempuan"];

  TextEditingController usernameController = TextEditingController(text: User.username);
  TextEditingController nameController = TextEditingController(text: User.name);
  TextEditingController emailController = TextEditingController(text: User.email);
  TextEditingController noHPController = TextEditingController(text: User.phone);

  Widget batas() {
    return const SizedBox(
      height: 24,
    );
  }

  Widget kotakInput({
    required TextEditingController controller_,
    required String text,
    dynamic type = TextInputType.text,
  }) {
    return TextField(
      keyboardType: type,
      controller: controller_,
      decoration: InputDecoration(
        labelText: text,
        fillColor: Colors.white,
        filled: true,
      ),
      style: const TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget teksBesar(String teks) {
    return Text(
      teks,
      style: const TextStyle(
        fontSize: 20,
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    nameController.dispose();
    emailController.dispose();
    noHPController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var fullWidth = MediaQuery.of(context).size.width;
    var fullHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: fullWidth,
        height: fullHeight,
        color: Colore.biru,
        child: ListView(
          children: [
            SafeArea(
              child: Column(
                children: [
                  batas(),
                  const Text(
                    "Data Diri Akun",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colore.putih,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        kotakInput(
                          controller_: usernameController,
                          text: "Username",
                        ),
                        batas(),
                        kotakInput(
                          controller_: nameController,
                          text: "Nama Lengkap",
                        ),
                        batas(),
                        kotakInput(
                          controller_: emailController,
                          text: "Email",
                          type: TextInputType.emailAddress,
                        ),
                        batas(),
                        kotakInput(
                          controller_: noHPController,
                          text: "Nomor HP",
                          type: TextInputType.phone,
                        ),
                        batas(),
                        const Text(
                          "Jenis Kelamin",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colore.putih,
                              fontWeight: FontWeight.w600),
                        ),
                        for (var item in genderList)
                          Row(
                            children: [
                              Radio(
                                activeColor: Colore.putih,
                                value: item,
                                groupValue: User.gender,
                                onChanged: (v) {
                                  setState(() {
                                    User.gender = v.toString();
                                  });
                                },
                              ),
                              Text(
                                item,
                                style:
                                    const TextStyle(fontSize: 20, color: Colore.putih),
                              ),
                            ],
                          ),
                        batas(),
                        SizedBox(
                          width: fullWidth,
                          height: 64,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                User.username = usernameController.text;
                                User.name = nameController.text;
                                User.email = emailController.text;
                                User.phone = noHPController.text;
                              });

                              const snackBar = SnackBar(
                                content: Text("Data akun berhasil disimpan!"),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colore.oranye,
                            ),
                            child: const Text(
                              "Simpan",
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
      ),
    );
  }
}