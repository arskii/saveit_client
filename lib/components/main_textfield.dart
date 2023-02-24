import 'package:flutter/material.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: const TextStyle(fontSize: 18)),
          TextFormField(
            validator: validator,
            onSaved: onSaved,
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                alignLabelWithHint: true,
                suffixIcon: suffixIcon,
                labelStyle: const TextStyle(fontSize: 20),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
                fillColor: Colors.white,
                filled: true,
                isDense: true),
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Jost',
            ),
          ),
        ],
      ),
    );
  }
}
