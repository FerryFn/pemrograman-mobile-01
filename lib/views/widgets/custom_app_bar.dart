import 'package:flutter/material.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/getx_controller/user_controller.dart';
import 'package:uas_mobile_2009106051_ferry_fathurrahman/utils/palette.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.uc,
  }) : super(key: key);

  final UserController uc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: const BoxDecoration(
        color: Palette.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(55, 5, 5, 23),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Halo,",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                uc.name.value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          CircleAvatar(
            child: Image.asset("assets/icon/cookfox.png"),
          ),
        ],
      ),
    );
  }
}
