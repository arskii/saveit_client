import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyBox extends StatelessWidget {
  final controller;
  final TextInputType keyboardType;
  VerifyBox({
    super.key,
    required this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: Color(0xff1FAB89),
          ),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
