import 'package:flutter/material.dart';

class Sign_Up_Button extends StatelessWidget {
  const Sign_Up_Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
