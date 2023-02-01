import 'package:budgetapp/components/main_button.dart';
import 'package:budgetapp/components/main_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
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
                  keyboardType: TextInputType.visiblePassword,
                  controller: repeatPasswordController,
                  labelText: 'Confirm Password',
                  obscureText: isHidden,
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(
                      Icons.remove_red_eye,
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
                SizedBox(
                  height: 40,
                ),

                Text(
                  'By clicking SIGN UP you agree to the following Terms and Conditions',
                  style: TextStyle(fontSize: 15),
                ),

                MainButton(
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
                      onPressed: () {},
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
                )
              ],
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
}
