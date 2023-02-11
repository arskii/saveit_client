import 'package:budgetapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainTexfield extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final String? Function(String?) validator;
  final Function(String?) onSaved;

  const MainTexfield(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.obscureText,
      required this.keyboardType,
      required this.validator,
      required this.onSaved,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        validator: validator,
        onSaved: onSaved,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          suffixIcon: suffixIcon,
          labelStyle: TextStyle(fontSize: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              )),
          fillColor: Colors.white,
          filled: true,
          labelText: labelText,
        ),
        style: TextStyle(
          fontFamily: 'Jost',
        ),
      ),
    );
  }
}
