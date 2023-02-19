import 'package:budgetapp/api/api_client.dart';
import 'package:budgetapp/components/main_button.dart';
import 'package:budgetapp/components/main_textfield.dart';
import 'package:budgetapp/components/title_screen.dart';
import 'package:budgetapp/screens/login_screen.dart';
import 'package:budgetapp/screens/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../components/social_button.dart';
import '../constants.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //text controlling
  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final repeatPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? _username, _email, _password, _returnPassword;

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
                  // Welcome
                  Expanded(
                    flex: 1,
                    child: TitleScreen(title: 'Create an account'),
                  ),

                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MainTexfield(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '* Required';
                            } else if (value.length < 4) {
                              return "Username should be at least 4 characters";
                            } else if (value.length > 30) {
                              return "Username should not be greater than 30 characters";
                            } else
                              return null;
                          },
                          onSaved: (input) => _username = input!,
                          keyboardType: TextInputType.text,
                          controller: usernameController,
                          labelText: 'Username',
                          obscureText: false,
                        ),

                        const SizedBox(
                          height: 20,
                        ),
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
                          controller: emailController,
                          labelText: 'Email',
                          obscureText: false,
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        // password Textfield

                        MainTexfield(
                          validator: (value) {
                            RegExp regex = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                            var passNonNullValue = value ?? "";
                            if (value!.isEmpty) {
                              return ("Password is required");
                            } else if (passNonNullValue.length < 7) {
                              return ("Password Must be more than 6 characters");
                            } else if (!regex.hasMatch(passNonNullValue)) {
                              return ("Password should contain upper,lower,digit and Special character ");
                            }
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
                          height: 20,
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
                            child: const Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: Icon(
                                Icons.remove_red_eye,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // or continue with
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Or sign in with',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        const SizedBox(
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
                                  icon: SvgPicture.asset(
                                      'assets/icons/google.svg')),
                              SocialButton(
                                onTap: () {},
                                icon: SvgPicture.asset(
                                    'assets/icons/facebook.svg'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const Text(
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
                      ],
                    ),
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
      Map<String, dynamic> datauser = {
        'username': _username,
        'email': _email,
        'password': _password
      };
      dynamic res = await ApiClient().registerUser(datauser);
      ScaffoldMessenger.of(context).hideCurrentSnackBar;
      print('Username: $_username, Email: $_email, Password: $_password');
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
