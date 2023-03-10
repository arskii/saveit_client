import 'package:budgetapp/components/main_button.dart';
import 'package:budgetapp/components/main_textfield.dart';
import 'package:budgetapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? _email, _name, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                mainColor,
                secondColor,
              ]),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MainTexfield(
                          controller: emailController,
                          labelText: 'Email',
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                          onSaved: (input) => _email = input!,
                        ),
                        MainTexfield(
                          controller: nameController,
                          labelText: 'Name',
                          obscureText: false,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                          onSaved: (input) => _name = input!,
                        ),
                        MainTexfield(
                          controller: emailController,
                          labelText: 'password',
                          obscureText: false,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                          onSaved: (input) => _password = input!,
                        ),
                        MainTexfield(
                          controller: emailController,
                          labelText: ' return password',
                          obscureText: false,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Your password no suitable';
                            }
                            return null;
                          },
                          onSaved: (input) => _password = input!,
                        ),
                      ]),
                  MainButton(text: 'Save It', onTap: () {})
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
