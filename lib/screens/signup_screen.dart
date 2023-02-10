import 'package:budgetapp/api/api_client.dart';
import 'package:budgetapp/components/main_button.dart';
import 'package:budgetapp/components/main_textfield.dart';
import 'package:budgetapp/screens/login_screen.dart';
import 'package:budgetapp/screens/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../components/social_button.dart';
import '../constants.dart';

class SignUP extends StatefulWidget {
  SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  //text controlling
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final repeatPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? _email, _password, _returnPassword;

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
                colors: [
                  mainColor,
                  secondColor,
                ]),
          ),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  const SizedBox(
                    height: 20,
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
                        'Create an account',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  // phone Textfield

                  // email Textfield

                  MainTexfield(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (value != null || value.isNotEmpty) {
                        String pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regex = new RegExp(pattern);
                        return (!regex.hasMatch(value))
                            ? 'email not valid'
                            : null;
                      }
                      return null;
                    },
                    onSaved: (input) => _email = input!,
                    keyboardType: TextInputType.emailAddress,
                    controller: usernameController,
                    labelText: 'Email',
                    obscureText: false,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // password Textfield

                  MainTexfield(
                    validator: (value) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      var passNonNullValue = value ?? "";
                      if (value!.isEmpty) {
                        return ("Password is required");
                      } else if (passNonNullValue.length < 6) {
                        return ("Password Must be more than 5 characters");
                      } else if (!regex.hasMatch(passNonNullValue)) {
                        return ("Password should contain upper,lower,digit and Special character ");
                      }
                      return null;
                      return null;
                    },
                    onSaved: (input) => _password = input!,
                    controller: passwordController,
                    labelText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isHidden,
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
                    height: 25,
                  ),

                  // repeat password
                  MainTexfield(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onSaved: (input) => _returnPassword = input!,
                    keyboardType: TextInputType.visiblePassword,
                    controller: repeatPasswordController,
                    labelText: 'Confirm Password',
                    obscureText: isHidden,
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
                    height: 25,
                  ),

                  // or continue with
                  Text(
                    'Or sign in with',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 22,
                  ),

                  // sign Up button
                  SizedBox(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SocialButton(
                            onTap: () {},
                            icon: SvgPicture.asset('assets/icons/google.svg')),
                        SocialButton(
                          onTap: () {},
                          icon: SvgPicture.asset('assets/icons/facebook.svg'),
                        )
                      ],
                    ),
                  ),

                  Text(
                    'By clicking SIGN UP you agree to the following Terms and Conditions',
                    style: TextStyle(fontSize: 15),
                  ),

                  MainButton(
                    onTap: () {
                      // Get.to(VerifyScreen());
                      _submit();
                    },
                    text: 'Sign up',
                  ),

                  // google + apple signup

                  // forgot password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontFamily: 'Jost', fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(LoginScreen());
                          // _submit;
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            color: accentColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      )
                    ],
                  ),
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
          'processing data',
        ),
        backgroundColor: Colors.green.shade300,
      ));
      Map<String, dynamic> datauser = {'email': _email, 'password': _password};
      dynamic res = await ApiClient().registerUser(datauser);
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
