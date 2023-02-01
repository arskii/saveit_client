import 'package:budgetapp/components/main_button.dart';
import 'package:budgetapp/components/main_textfield.dart';
import 'package:budgetapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecoveryScreen extends StatefulWidget {
  RecoveryScreen({super.key});

  @override
  State<RecoveryScreen> createState() => _RecoveryScreenState();
}

class _RecoveryScreenState extends State<RecoveryScreen> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  mainColor,
                  secondColor,
                ]),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/pig.svg',
                    ),
                    Text(
                      'Recovery',
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
                  ],
                ),
                SizedBox(
                  height: 150,
                ),
                Text(
                  'We\'ll send you an email with a recovery code',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Jost',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                MainTexfield(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  labelText: 'Email',
                  controller: emailController,
                ),
                SizedBox(
                  height: 190,
                ),
                MainButton(
                  text: 'Send',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
