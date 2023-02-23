import 'package:budgetapp/screens/bill_screen/bill_screen.dart';
import 'package:budgetapp/screens/bill_screen/pages/sub_page.dart';
import 'package:budgetapp/screens/entities_screen.dart';
import 'package:budgetapp/screens/expenses_screen/expenses_screen.dart';
import 'package:budgetapp/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:budgetapp/constants.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int _currentIndex = 0;
  final screens = const <Widget>[
    EntitiesScreen(),
    BillScreen(),
    SubPage(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          iconSize: 24,
          backgroundColor: const Color(0x00FFFFFF),
          elevation: 0,
          unselectedItemColor: textPrimary,
          selectedItemColor: accentColor,
          unselectedLabelStyle: const TextStyle(color: textGray),
          onTap: (value) {
            setState(() => _currentIndex = value);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard),
              label: 'Statics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/setting.svg'),
              label: 'Settings',
            ),
          ],
        ));
  }
}
