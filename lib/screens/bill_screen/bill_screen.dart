import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:budgetapp/components/bottom_menu.dart';
import 'package:budgetapp/screens/bill_screen/pages/sub_page.dart';
import 'package:budgetapp/constants.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Bill ${_tabController.index + 1} ',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          backgroundColor: Color(0xffffffff),
          titleTextStyle: TextStyle(color: textPrimary, fontSize: 18),
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 100,
          leading: IconButton(
            color: textPrimary,
            icon: SvgPicture.asset('assets/icons/backButton.svg'),
            onPressed: () {},
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: IconButton(
                    color: textPrimary,
                    icon: SvgPicture.asset('assets/icons/addIcon.svg'),
                    onPressed: () {},
                  ),
                )),
          ],
          bottom: TabBar(
              controller: _tabController,
              labelColor: textPrimary,
              indicatorColor: textActive,
              labelStyle: TextStyle(fontWeight: FontWeight.w700),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
              tabs: [
                Tab(
                  text: 'Bills',
                ),
                Tab(
                  text: 'Payments',
                ),
                Tab(
                  text: 'Subscription',
                )
              ]),
        ),
        bottomNavigationBar: BottomMenu(),
        body: TabBarView(
          controller: _tabController,
          children: [
            Center(
              child: Text('Tab 1'),
            ),
            Center(
              child: Text('Tab 2'),
            ),
            Center(
              child: SubPage(),
            )
          ],
        ));
  }
}
