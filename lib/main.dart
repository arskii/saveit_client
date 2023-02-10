import 'package:budgetapp/components/bottom_menu.dart';
import 'package:budgetapp/screens/expenses_screen/expenses_screen.dart';
import 'package:budgetapp/screens/login_screen.dart';
import 'package:budgetapp/screens/pincode_screen.dart';
import 'package:budgetapp/screens/recovery_screen.dart';
import 'package:budgetapp/screens/signup_screen.dart';
import 'package:budgetapp/screens/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:budgetapp/screens/bill_screen/bill_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // remove debug flag
      title: 'Budget app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'BebasNeue',
      ),
      home: LoginScreen(),
    );
  }
}
