import 'package:budgetapp/components/pincode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key});

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final OtpFieldController controller = OtpFieldController();
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
                const SizedBox(
                  height: 60,
                  width: 30,
                ),

                // Welcome
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/pig.svg'),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Pin Code',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.all(20),
                  child: SizedBox(
                    height: 70,
                    child: Center(
                      child: OTPTextField(
                        controller: controller,
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
                  ),
                ),
                PinCode(
                  buttonSize: 80,
                  buttonColor: Colors.white,
                  controller: controller,
                  delete: () {
                    controller.text = controller.text.substring(
                      0,
                      controller.text.length - 1,
                    );
                  },
                  onSubmit: () {
                    debugPrint('your code is ${controller.text}');
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Forgot your pin?',
                  style: TextStyle(fontSize: 16, fontFamily: 'Jost'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
