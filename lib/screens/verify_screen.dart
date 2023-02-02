import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:budgetapp/components/main_button.dart';
import 'package:budgetapp/components/pincode_field.dart';

import '../constants.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/pig.svg',
                    ),
                    Text(
                      'Verify your email',
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
                  ],
                ),
                SizedBox(
                  height: 120,
                ),
                Text(
                  'Check you email for this 4 digit code and enter it here',
                  style: TextStyle(fontSize: 16, fontFamily: 'Jost'),
                ),
                SizedBox(
                  height: 40,
                ),
                // VerifyBox(
                //   controller: verifyController,
                //   keyboardType: TextInputType.number,
                // ),
                SizedBox(
                  width: 270,
                  child: PinCodeFields(
                    keyboardType: TextInputType.number,
                    activeBorderColor: accentColor,
                    controller: controller,
                    length: 4,
                    fieldWidth: 45,
                    textStyle: TextStyle(fontSize: 20),
                    onChange: (pin) {
                      print("Changed: " + pin);
                    },
                    onComplete: (pin) {
                      print("Completed: " + pin);
                    },
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                MainButton(text: 'Confirm', onTap: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
