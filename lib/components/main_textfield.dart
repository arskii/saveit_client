import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainTexfield extends StatelessWidget {
  final controller;
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;

  const MainTexfield(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.obscureText,
      required this.keyboardType,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelStyle: TextStyle(fontSize: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              )),
          fillColor: Colors.white,
          filled: true,
          labelText: labelText,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
