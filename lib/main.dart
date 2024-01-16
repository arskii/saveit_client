import 'package:budgetapp/constants.dart';
import 'package:budgetapp/screens/auth_screen.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightColorScheme, ColorScheme? darkColorScheme) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false, // remove debug flag
        title: 'Budget app',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          fontFamily: 'BebasNeue',
        ),
        darkTheme: AppTheme.darkTheme(darkColorScheme),
        home: AuthScreen(),
      );
    });
  }
}
