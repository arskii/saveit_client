import 'package:flutter/material.dart';

class TextFieldSignup extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const TextFieldSignup({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText),
      ),
    );
  }
}
