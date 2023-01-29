import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/signup_button.dart';
import 'components/textfield_signup.dart';

class SignUP extends StatelessWidget {
  SignUP({super.key});

  //text controlling
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff67EACA),
      body: SafeArea(
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
                    height: 50,
                  ),
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),

              // phone Textfield

              // email Textfield

              TextFieldSignup(
                controller: usernameController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(
                height: 25,
              ),

              // password Textfield

              TextFieldSignup(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(
                height: 25,
              ),

              // repeat password
              TextFieldSignup(
                controller: phoneController,
                hintText: 'phone',
                obscureText: false,
              ),

              const SizedBox(
                height: 25,
              ),

              // sign Up button
              Sign_Up_Button(),

              // or continue with

              // google + apple signup

              // forgot password
              Text(
                "Forgot Password?",
                style: TextStyle(fontFamily: 'Jost'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
