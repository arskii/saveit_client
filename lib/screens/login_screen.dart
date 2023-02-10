// ignore_for_file: prefer_const_constructors

import 'package:budgetapp/api/api_client.dart';
import 'package:budgetapp/components/main_button.dart';
import 'package:budgetapp/components/pincode_numpud.dart';
import 'package:budgetapp/main.dart';
import 'package:budgetapp/screens/pincode_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/main_textfield.dart';
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
// final controller
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _email, _password;

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
                colors: const [
                  mainColor,
                  secondColor,
                ]),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),

                // text welcome
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/pig.svg'),
                    Text(
                      'Welcome back',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 225),
                MainTexfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (input) => _email = input!,
                  keyboardType: TextInputType.emailAddress,
                  controller: usernameController,
                  labelText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 17),

                // password

                MainTexfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (input) => _password = input!,
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  labelText: 'Password',
                  obscureText: true,
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(
                      Icons.remove_red_eye,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                Text(
                  'Forgot your password?',
                  style: TextStyle(fontFamily: 'Jost', fontSize: 16.0),
                ),
                MainButton(
                  onTap: () {
                    _submit();
                    //Get.to(PinCodeScreen());
                  },
                  text: 'Log in',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(
          'processing data',
        ),
        backgroundColor: Colors.green.shade300,
      ));
      Map<String, dynamic> datauser = {'email': _email, 'password': _password};
      dynamic res = await ApiClient().login(datauser);
      ScaffoldMessenger.of(context).hideCurrentSnackBar;
      print('Email: $_email, Password: $_password');
      //if (res['ErrorCode'] == null)
      // {
      //   Get.to(LoginScreen());
      // }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${['Message']}'),
          backgroundColor: Colors.red.shade300,
        ),
      );
    }
  }
}
