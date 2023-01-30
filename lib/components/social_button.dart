import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final Widget icon;

  const SocialButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 65, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xff1FAB89), width: 2),
      ),
      child: Center(child: icon),
    );
  }
}
