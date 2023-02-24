import 'package:budgetapp/components/bottom_menu.dart';
import 'package:budgetapp/constants.dart';
import 'package:budgetapp/screens/auth_screen.dart';
import 'package:flutter/material.dart';
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
        useMaterial3: true,
        colorSchemeSeed: accentColor,
        fontFamily: 'BebasNeue',
      ),
      home: AuthScreen(),
    );
  }
}
