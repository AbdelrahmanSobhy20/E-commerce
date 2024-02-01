import 'package:flutter/material.dart';
import 'constant.dart';

class RouteText extends StatelessWidget {
  final String? text;
  final Function()? funtion;

  const RouteText({super.key, this.text, required this.funtion});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: funtion,
        child: Text(
          text!,
          style: const TextStyle(
              color: Constants.primaryColor, decoration: TextDecoration.none),
        ));
  }
}
