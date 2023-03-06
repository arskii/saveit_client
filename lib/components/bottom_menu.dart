import 'package:budgetapp/screens/bill_screen/bill_screen.dart';
import 'package:budgetapp/screens/bill_screen/pages/sub_page.dart';
import 'package:budgetapp/screens/entities_screen.dart';
import 'package:budgetapp/screens/expenses_screen/expenses_screen.dart';
import 'package:budgetapp/screens/home_screen.dart';
import 'package:budgetapp/screens/settings_screen.dart';
import 'package:budgetapp/screens/statics_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:budgetapp/constants.dart';

import '../screens/profile_screen.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int _currentIndex = 0;
  final screens = const <Widget>[
    HomeScreen(),
    StaticsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (value) {
            setState(() => _currentIndex = value);
          },
          destinations: const <NavigationDestination>[
            NavigationDestination(
              selectedIcon: Icon(Icons.apps),
              icon: Icon(Icons.apps_outlined),
              label: 'Dashboard',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.leaderboard),
              icon: Icon(Icons.leaderboard_outlined),
              label: 'Statics',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ));
  }
}
