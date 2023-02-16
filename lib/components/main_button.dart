import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Function onTap;
  MainButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Color(0xff1FAB89),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
