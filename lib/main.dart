import 'package:budgetapp/components/bottom_menu.dart';
import 'package:budgetapp/screens/expenses_screen/expenses_screen.dart';
import 'package:flutter/material.dart';

import 'package:budgetapp/screens/bill_screen/bill_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // remove debug flag
      title: 'Budget app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'DMSans',
      ),
      home: const BottomMenu(),
    );
  }
}
