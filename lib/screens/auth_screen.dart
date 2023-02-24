import 'package:budgetapp/components/second_button.dart';
import 'package:budgetapp/screens/login_screen.dart';
import 'package:budgetapp/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
        decoration: const BoxDecoration(
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
              SizedBox(height: h / 8),
              const SizedBox(
                width: 350,
                child: Text(
                  'SAVE YOUR MONEY TO ENJOY YOUR LIFE',
                  style: TextStyle(fontSize: 50),
                ),
              ),
              const SizedBox(height: 50),
              MainButton(
                onTap: () {
                  Get.to(() => SignUpScreen());
                },
                text: 'Sign Up',
              ),
              SecondButton(
                onTap: () => Get.to(() => LoginScreen()),
                text: 'login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
