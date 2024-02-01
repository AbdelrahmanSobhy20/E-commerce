import 'package:flutter/material.dart';

class Text_Field extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final TextInputType? input;
  final bool passBool;
  final TextEditingController? controller;

  const Text_Field({super.key, 
    this.icon,
    this.text,
    this.input,
    this.passBool = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
          labelText: text,
          labelStyle: const TextStyle(color: Colors.black),
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          fillColor: Colors.grey.shade200,
          filled: true),
      keyboardType: input,
      obscureText: passBool,
    );
  }
}
