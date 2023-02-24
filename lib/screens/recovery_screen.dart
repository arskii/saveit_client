import 'package:budgetapp/components/main_button.dart';
import 'package:budgetapp/components/main_textfield.dart';
import 'package:budgetapp/components/title_screen.dart';
import 'package:budgetapp/constants.dart';
import 'package:budgetapp/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoveryScreen extends StatefulWidget {
  const RecoveryScreen({super.key});

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: const TitleScreen(title: 'Recovery'),
          toolbarHeight: 150,
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'We\'ll send you an email with a recovery code',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Jost',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    MainTexfield(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                      onSaved: (input) => _email = input,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      labelText: 'Email',
                      controller: emailController,
                    ),
                  ],
                ),
                MainButton(
                  onTap: () => Get.to(() => const LoginScreen()),
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
