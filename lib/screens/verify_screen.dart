import 'package:budgetapp/components/login_button.dart';
import 'package:budgetapp/components/verify_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final OtpFieldController otpController = OtpFieldController();
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
                Container(
                  width: 270,
                  child: OTPTextField(
                    controller: otpController,
                    length: 4,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 45,
                    style: TextStyle(fontSize: 20),
                    textFieldAlignment: MainAxisAlignment.spaceBetween,
                    fieldStyle: FieldStyle.box,
                    onChanged: (pin) {
                      print("Changed: " + pin);
                    },
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                    },
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                LoginButton(text: 'Confirm')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
