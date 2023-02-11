import 'package:budgetapp/api/api_client.dart';
import 'package:budgetapp/components/main_button.dart';
import 'package:budgetapp/screens/recovery_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/main_textfield.dart';
import '../components/title_screen.dart';
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

  bool isHidden = true;

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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleScreen(title: 'Welcome back'),

                  const SizedBox(height: 80),
                  MainTexfield(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
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
                        return 'Please enter password';
                      }
                      return null;
                    },
                    onSaved: (input) => _password = input!,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    labelText: 'Password',
                    obscureText: true,
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(
                          Icons.remove_red_eye,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(RecoveryScreen());
                    },
                    child: Text(
                      'Forgot your password?',
                      style: TextStyle(
                          fontFamily: 'Jost',
                          fontSize: 18.0,
                          color: Colors.black),
                    ),
                  ),
                  MainButton(
                    onTap: () {
                      _submit();
                    },
                    text: 'Log in',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(
          'Processing data',
          textAlign: TextAlign.center,
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
          content: Text(
            'Email or password does not match',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red.shade300,
        ),
      );
    }
  }
}
