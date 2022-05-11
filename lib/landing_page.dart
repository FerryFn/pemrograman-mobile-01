import 'package:flutter/material.dart';
import 'variables.dart';

class LandingPageContent extends StatelessWidget {
  const LandingPageContent({
    Key? key,
    required this.image,
    required this.header,
    required this.desc,
  }) : super(key: key);

  final String image;
  final String header;
  final String desc;

  @override
  Widget build(BuildContext context) {
    var mediaQuerySize = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          image,
          fit: BoxFit.contain,
          width: mediaQuerySize.width / 1.1,
          height: mediaQuerySize.width / 1.1,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colore.putih,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              desc,
              style: const TextStyle(
                fontSize: 16,
                color: Colore.putih,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    PageController _controller = PageController(initialPage: 0);

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 18),
          color: Colore.biru,
          child: SafeArea(
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  children: const [
                    LandingPageContent(
                      image: "assets/illus1.png",
                      header: "CookFox, Kuasai Dunia Kuliner",
                      desc:
                          "Dunia masak-memasak, semuanya lebih mudah, semuanya ada dalam genggaman Anda",
                    ),
                    LandingPageContent(
                      image: "assets/illus2.png",
                      header: "Cari, Simpan, Masak",
                      desc:
                          "Anda dapat mencari dan menyimpan masakan favorit Anda untuk diikuti nantinya",
                    ),
                    LandingPageContent(
                      image: "assets/illus3.png",
                      header: "Berbagai Macam Masakan untuk Dicoba!",
                      desc:
                          "Anda takkan bosan-bosannya menemukan masakan-masakan baru!",
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "<=    Scroll    =>",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colore.putih,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height: 72,
                      width: mQSize.width,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/main");
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colore.putih,
                          onPrimary: Colore.biru,
                        ),
                        child: const Text(
                          "Mulai Sekarang!",
                          style: TextStyle(
                            color: Colore.biru,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
