import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class TitleScreen extends StatelessWidget {
  final String title;
  const TitleScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icons/pig.svg'),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
          ),
        ),
      ],
    );
  }
}
