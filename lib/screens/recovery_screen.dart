import 'package:budgetapp/components/main_button.dart';
import 'package:budgetapp/components/main_textfield.dart';
import 'package:budgetapp/components/title_screen.dart';
import 'package:budgetapp/constants.dart';
import 'package:budgetapp/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RecoveryScreen extends StatefulWidget {
  RecoveryScreen({super.key});

  @override
  State<RecoveryScreen> createState() => _RecoveryScreenState();
}

class _RecoveryScreenState extends State<RecoveryScreen> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _email;
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
                TitleScreen(title: 'Recovery'),
                SizedBox(
                  height: 150,
                ),
                const Text(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (input) => _email = input,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  labelText: 'Email',
                  controller: emailController,
                ),
                SizedBox(height: 130),
                MainButton(
                  onTap: () => Get.to(LoginScreen()),
                  text: 'Send',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Email: $_email');
    }
  }
}
