import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox({
    Key? key,
    required this.controller,
    required this.text,
    this.type = TextInputType.text,
    this.minLines = 1,
  }) : super(key: key);

  final TextEditingController controller;
  final String text;
  final TextInputType type;
  final int minLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: minLines,
      maxLines: 10,
      keyboardType: type,
      controller: controller,
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
}
