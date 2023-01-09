import 'package:budgetapp/screens/bill_screen/bill_screen.dart';
import 'package:budgetapp/screens/bill_screen/pages/sub_page.dart';
import 'package:budgetapp/screens/expenses_screen/expenses_screen.dart';
import 'package:budgetapp/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
    ExpScreen(),
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
          unselectedItemColor: textPrimary,
          selectedItemColor: textActive,
          unselectedLabelStyle: const TextStyle(color: textGray),
          onTap: (value) {
            setState(() => _currentIndex = value);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/overview.svg'),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/calendar.svg'),
              label: 'This month',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/ticket.svg'),
              label: 'Offers',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/setting.svg'),
              label: 'Settings',
            ),
          ],
        ));
  }
}
