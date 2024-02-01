import 'package:flutter/material.dart';

class CaptionText extends StatelessWidget {
  final String? text;

  const CaptionText({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.grey, fontSize: 20),
    );
  }
}
