import 'package:budgetapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const SecondButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: accentColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
