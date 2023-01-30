import 'package:budgetapp/components/login_button.dart';
import 'package:budgetapp/components/textfield_login.dart';
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
    return Scaffold(
      backgroundColor: Color(0xff67EACA),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff67EACA),
                    Color(0xffFCF9EC),
                  ]),
            ),
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
                LoginTexfield(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  labelText: 'Email',
                  controller: emailController,
                ),
                SizedBox(
                  height: 190,
                ),
                LoginButton(
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
