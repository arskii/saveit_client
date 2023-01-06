import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_svg/svg.dart';
import 'package:budgetapp/constants.dart';

class ExpScreen extends StatefulWidget {
  const ExpScreen({super.key});

  @override
  State<ExpScreen> createState() => _ExpScreenState();
}

class _ExpScreenState extends State<ExpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expenses',
          style: TextStyle(fontWeight: FontWeight.w700, color: textPrimary),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 100,
        leading: IconButton(
          color: textPrimary,
          icon: SvgPicture.asset('assets/icons/backButton.svg'),
          onPressed: () {},
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: IconButton(
                  color: textPrimary,
                  icon: SvgPicture.asset('assets/icons/addIcon.svg'),
                  onPressed: () {},
                ),
              )),
        ],
      ),
    );
  }
}
