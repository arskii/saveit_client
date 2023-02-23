import 'package:budgetapp/components/title_screen.dart';
import 'package:budgetapp/screens/recovery_screen.dart';
import 'package:flutter/material.dart';

import 'package:budgetapp/components/pincode_field.dart';
import 'package:budgetapp/components/pincode_numpud.dart';

import 'package:get/get.dart';
import '../constants.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key});

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: h,
          decoration: const BoxDecoration(
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
                // Welcome
                const Expanded(flex: 1, child: TitleScreen(title: 'Pin Code')),

                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 270,
                      height: 80,
                      child: PinCodeFields(
                        focusNode: focusNode,
                        fieldHeight: 70,
                        fieldWidth: 45,
                        fieldBorderStyle: FieldBorderStyle.bottom,
                        keyboardType: TextInputType.none,
                        borderWidth: 2,
                        borderColor: Colors.white,
                        activeBorderColor: Color(0xFF1FAB89),
                        textStyle: const TextStyle(fontSize: 25),
                        length: 4,
                        controller: controller,
                        animation: Animations.slideInDown,
                        onComplete: (output) {
                          print(output);
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
                    if (controller.text.isNotEmpty) {
                      controller.text = controller.text.substring(
                        0,
                        controller.text.length - 1,
                      );
                    }
                  },
                  onSubmit: () {
                    debugPrint('your code is ${controller.text}');
                  },
                ),

                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => RecoveryScreen());
                      print('You clicked');
                    },
                    child: const Text(
                      'Forgot your pin?',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Jost',
                          color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
