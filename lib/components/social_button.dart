import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final Widget icon;
  final Function onTap;
  const SocialButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xff1FAB89), width: 2),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
