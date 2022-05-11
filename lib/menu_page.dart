import 'package:flutter/material.dart';

import 'variables.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    var mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colore.biru,
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: mediaQuerySize.width,
                padding: const EdgeInsets.all(18),
                decoration: const BoxDecoration(
                  color: Colore.putih,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(55, 5, 5, 23),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/profile.png",
                      height: 48,
                      width: 48,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Halo,",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            User.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(18),
                  children: const [
                    Kartu(),
                    Kartu(
                      image: "assets/nasigoreng.jpg",
                      title: "Nasi Goreng Spesial",
                      rating: "4.5",
                      time: "45m",
                    ),
                    Kartu(
                      image: "assets/spaghettibolognese.jpg",
                      title: "Spaghetti Bolognese Uenak",
                      rating: "4.4",
                      time: "49m",
                    ),
                    Kartu(
                      image: "assets/sate.jpg",
                      title: "Sate",
                      rating: "4.8",
                      time: "30m",
                    ),
                    Kartu(
                      image: "assets/bakso.jpg",
                      title: "Bakso",
                      rating: "4.5",
                      time: "1j",
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

class Kartu extends StatelessWidget {
  const Kartu({
    Key? key,
    this.image = "assets/rendang.jpg",
    this.title = "Rendang",
    this.rating = "4.9",
    this.time = "3j",
  }) : super(key: key);

  final String image;
  final String title;
  final String rating;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 128,
        padding: const EdgeInsets.all(9),
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
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
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                          ),
                          Text(rating),
                        ],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.timelapse,
                            size: 16,
                          ),
                          Text(time),
                        ],
                      ),
                    ],
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
