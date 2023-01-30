import 'package:budgetapp/components/login_button.dart';
import 'package:budgetapp/components/textfield_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/social_button.dart';

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

                LoginTexfield(
                  keyboardType: TextInputType.emailAddress,
                  controller: usernameController,
                  labelText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(
                  height: 25,
                ),

                // password Textfield

                LoginTexfield(
                  controller: passwordController,
                  labelText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
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
                  height: 25,
                ),

                // repeat password
                LoginTexfield(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  labelText: 'Confirm Password',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialButton(
                        icon: SvgPicture.asset('assets/icons/google.svg')),
                    SocialButton(
                      icon: SvgPicture.asset('assets/icons/facebook.svg'),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),

                Text(
                  'By clicking SIGN UP you agree to the following Terms and Conditions',
                  style: TextStyle(fontSize: 14),
                ),

                LoginButton(
                  text: 'Sign up',
                ),

                // google + apple signup

                // forgot password
                Text(
                  "Already have an account? Login",
                  style: TextStyle(fontFamily: 'Jost', fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
