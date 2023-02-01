import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/main_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/main_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/icons/logo.svg',
              ),
              SizedBox(height: h / 4),
              SizedBox(
                width: 350,
                child: Text(
                  'SAVE YOUR MONEY TO ENJOY YOUR LIFE',
                  style: TextStyle(fontSize: 50),
                ),
              ),
              SizedBox(height: 50),
              MainButton(
                text: 'Sign Up',
              )
            ],
          ),
        ),
      ),
    );
  }
}
