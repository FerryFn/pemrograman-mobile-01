import 'package:flutter/material.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/utils/palette.dart';

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
                color: Palette.white,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              desc,
              style: const TextStyle(
                fontSize: 16,
                color: Palette.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}