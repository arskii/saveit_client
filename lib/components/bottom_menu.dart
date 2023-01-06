import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:budgetapp/constants.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: 24,
      unselectedItemColor: textPrimary,
      selectedItemColor: textActive,
      unselectedLabelStyle: const TextStyle(color: textGray),
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
    );
  }
}
